#!/usr/bin/env bash
# check-env.sh — 작업환경 점검 (읽기 전용 · Mac / Windows(Git Bash) / Linux 공용)
#
# 하는 일 : 이 기기의 클라우드 폴더 · git 레포 · AI 환경(Claude/Codex)을 훑어 마크다운 보고서를 만든다.
# 안 하는 일: 파일 수정/삭제/이동, push/pull/commit, 비밀 내용 출력(파일 경로만 표시).
#             (git status 는 --no-optional-locks 로 실행. 쓰기는 결과 파일과 임시 폴더뿐)
#
# 사용: bash check-env.sh [옵션]
#   --no-net            원격(GitHub) 조회(ls-remote)를 생략
#   --fetch             git fetch 실행 (원격 추적 브랜치만 갱신, '뒤처짐' 수를 정확히 계산)
#   --roots "경로:경로"  추가로 훑을 폴더 (Windows Git Bash는 /c/Users/... 형식)
#   --out 폴더          결과 저장 폴더 (기본: 이 스크립트 옆 '결과/')
#
# 결과: <결과폴더>/<호스트>-<날짜-시각>.md  (기기마다 파일명이 달라 3대 동시 실행해도 충돌 없음)
VERSION="1.0"

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUT_DIR="$HERE/결과"
NO_NET=0
DO_FETCH=0
EXTRA_ROOTS=""
while [ $# -gt 0 ]; do
  case "$1" in
    --no-net) NO_NET=1 ;;
    --fetch)  DO_FETCH=1 ;;
    --roots)  shift; EXTRA_ROOTS="${1:-}" ;;
    --out)    shift; OUT_DIR="${1:-$OUT_DIR}" ;;
    -h|--help) sed -n '2,17p' "$0"; exit 0 ;;
    *) echo "알 수 없는 옵션: $1" >&2; exit 2 ;;
  esac
  shift
done

case "$(uname -s)" in
  Darwin) OS=mac ;;
  MINGW*|MSYS*|CYGWIN*) OS=win ;;
  Linux) OS=linux ;;
  *) OS=other ;;
esac

# 인증 창/프롬프트가 뜨지 않게 한다 (조회가 안 되면 '조회 실패'로만 표시)
export GIT_TERMINAL_PROMPT=0 GCM_INTERACTIVE=never
export GIT_SSH_COMMAND="ssh -o BatchMode=yes -o ConnectTimeout=10"

# ── 도우미 ─────────────────────────────────────────────────────────
to() { # to 초 명령... : 시간 제한 실행 (timeout / gtimeout / perl 중 가능한 것)
  local s="$1"; shift
  if command -v timeout >/dev/null 2>&1; then timeout "$s" "$@"
  elif command -v gtimeout >/dev/null 2>&1; then gtimeout "$s" "$@"
  elif command -v perl >/dev/null 2>&1; then perl -e 'alarm shift; exec @ARGV' "$s" "$@"
  else "$@"; fi
}
mask() { sed -E 's#(https?://)[^/@ ]+@#\1***@#g'; }          # URL 속 토큰/계정 가리기
tilde() { printf '%s' "$1" | sed "s#^$HOME#~#"; }
in_cloud() {
  case "$1" in
    *OneDrive*|*iCloud*|*CloudStorage*|*"Mobile Documents"*|*Dropbox*|*"Google Drive"*|*GoogleDrive*) return 0 ;;
  esac
  return 1
}
md5of() {
  if command -v md5sum >/dev/null 2>&1; then md5sum "$1" 2>/dev/null | cut -d' ' -f1
  elif command -v md5 >/dev/null 2>&1; then md5 -q "$1" 2>/dev/null
  fi
}
say() { printf '%s\n' "$*" >&2; }

TMP="$(mktemp -d 2>/dev/null)"
if [ -z "$TMP" ]; then TMP="/tmp/check-env.$$"; mkdir -p "$TMP"; fi
trap 'rm -rf "$TMP"' EXIT
SEC="$TMP/sec"; mkdir -p "$SEC"
CUR="$SEC/00"
sec() { CUR="$SEC/$1"; : > "$CUR"; }
p() { printf '%s\n' "$*" >> "$CUR"; }

mkdir -p "$OUT_DIR" || { echo "결과 폴더를 만들 수 없음: $OUT_DIR" >&2; exit 1; }

HOST=""
if [ "$OS" = mac ] && command -v scutil >/dev/null 2>&1; then HOST="$(scutil --get LocalHostName 2>/dev/null)"; fi
[ -z "$HOST" ] && HOST="$(hostname 2>/dev/null | cut -d. -f1)"
[ -z "$HOST" ] && HOST="unknown"
SAFE_HOST="$(printf '%s' "$HOST" | tr -c 'A-Za-z0-9_-' '_')"
STAMP="$(date +%Y%m%d-%H%M)"
OUT="$OUT_DIR/${SAFE_HOST}-${STAMP}.md"

# ── 훑을 위치 ──────────────────────────────────────────────────────
CLOUD_ROOTS=()
for d in "$HOME"/OneDrive* "$HOME/iCloudDrive" "$HOME/Dropbox" "$HOME/Google Drive" \
         "$HOME/Library/CloudStorage"/* "$HOME/Library/Mobile Documents/com~apple~CloudDocs"; do
  [ -d "$d" ] && CLOUD_ROOTS+=("$d")
done
DEV_ROOTS=()
for d in dev Developer code projects repos src workspace Workspace Desktop Documents; do
  [ -d "$HOME/$d" ] && DEV_ROOTS+=("$HOME/$d")
done
if [ -n "$EXTRA_ROOTS" ]; then
  IFS=':' read -r -a _extra <<< "$EXTRA_ROOTS"
  for d in "${_extra[@]}"; do [ -d "$d" ] && DEV_ROOTS+=("$d"); done
fi

# ── 한 번의 find 로 레포·의존성·.claude·충돌본·비밀파일 후보를 모은다 ──
SCAN="$TMP/scan.txt"; : > "$SCAN"
: > "$TMP/timeout.txt"
scan_root() { # $1=루트 $2=깊이
  local r="$1" dp="$2" rc
  to 240 find -H "$r" -maxdepth "$dp" \
    \( -name node_modules -o -name .venv -o -name venv -o -name .next \) -prune -print -o \
    \( -name .git -o -name .claude \) -prune -print -o \
    \( -name __pycache__ -o -name .cache -o -name .npm -o -name .nvm -o -name .pyenv -o -name .cargo \
       -o -name .rustup -o -name .gradle -o -name .m2 -o -name AppData -o -name Library -o -name Applications \
       -o -name .Trash -o -name Pictures -o -name Music -o -name Movies -o -name .vscode -o -name .vscode-shared \) -prune -o \
    -type f \( -name auth.json -o -name .credentials.json -o -name .claude.json -o -name '*.pem' -o -name '*.key' \
       -o -name 'id_rsa*' -o -name .env -o -name .env.local -o -name .env.production \
       -o -name '* (1).*' -o -name '* (2).*' -o -name '* 2.*' -o -name '*conflict*' \
       -o -name '*-DESKTOP-*' -o -name '*-LAPTOP-*' -o -name '*MacBook*' \) -print \
    2>/dev/null >> "$SCAN"
  rc=$?
  if [ $rc -eq 124 ] || [ $rc -eq 142 ]; then echo "$r" >> "$TMP/timeout.txt"; fi
}
say "[1/6] 폴더 훑는 중 (클라우드 폴더가 크면 몇 분 걸립니다)..."
scan_root "$HOME" 3
for r in "${DEV_ROOTS[@]}"; do scan_root "$r" 5; done
for r in "${CLOUD_ROOTS[@]}"; do say "      - $(tilde "$r")"; scan_root "$r" 7; done
sort -u "$SCAN" -o "$SCAN"

: > "$TMP/gitpaths.txt"; : > "$TMP/deps.txt"; : > "$TMP/claudedirs.txt"; : > "$TMP/secrets.txt"; : > "$TMP/conflicts.txt"
while IFS= read -r f; do
  b="${f##*/}"
  case "$b" in
    node_modules|.venv|venv|.next) echo "$f" >> "$TMP/deps.txt" ;;
    .git) echo "$f" >> "$TMP/gitpaths.txt" ;;
    .claude) echo "$f" >> "$TMP/claudedirs.txt" ;;
    auth.json|.credentials.json|.claude.json|*.pem|*.key|id_rsa*|.env|.env.local|.env.production) echo "$f" >> "$TMP/secrets.txt" ;;
    *) case "$b" in
         *" 2."[0-9]*) ;;                                  # 'Setup 2.5.3', '오후 2.34' 같은 정상 이름 제외
         *) in_cloud "$f" && echo "$f" >> "$TMP/conflicts.txt" ;;   # 충돌본은 클라우드 폴더 안만 집계
       esac ;;
  esac
done < "$SCAN"
sed 's#/\.git$##' "$TMP/gitpaths.txt" | sort -u > "$TMP/repopaths.txt"

# ── 1. 기기 정보 ───────────────────────────────────────────────────
sec 10
p "## 1. 기기 정보"
p "- 호스트: $HOST"
p "- 사용자: $(whoami 2>/dev/null)"
p "- OS: $(uname -sr) (구분: $OS)"
p "- HOME: $HOME"
case "$OS" in
  mac) p "- 모델: $(sysctl -n hw.model 2>/dev/null) / macOS $(sw_vers -productVersion 2>/dev/null)" ;;
  win)
    wm="$(to 25 powershell.exe -NoProfile -Command '$m=Get-CimInstance Win32_ComputerSystem; $c=(Get-CimInstance Win32_SystemEnclosure).ChassisTypes -join ","; "$($m.Manufacturer) $($m.Model) / chassis=$c (9,10,14=laptop; 3,4,5,6,7,15=desktop)"' 2>/dev/null | tr -d '\r')"
    p "- 모델: ${wm:-확인 못 함}" ;;
esac
p "- git: $(git --version 2>/dev/null) / core.autocrlf=$(git config --global core.autocrlf 2>/dev/null || true)"
p "- 점검: check-env.sh v$VERSION, $(date '+%Y-%m-%d %H:%M'), 옵션 no-net=$NO_NET fetch=$DO_FETCH"
if [ -s "$TMP/timeout.txt" ]; then p "- ⚠️ 시간 초과로 일부만 훑은 폴더: $(tr '\n' ' ' < "$TMP/timeout.txt")"; fi

# ── 2. 클라우드 동기화 폴더 ─────────────────────────────────────────
say "[2/6] 클라우드 폴더 확인..."
sec 20
p "## 2. 클라우드 동기화 폴더"
sample_cloudonly() { # $1=루트 → 앞쪽 파일 3000개 표본에서 '내려받지 않은 파일' 추정
  local root="$1" files res fmt
  files="$(to 90 find -H "$root" -maxdepth 6 \( -name node_modules -o -name .git -o -name .venv -o -name venv -o -name .next \) -prune -o -type f -print 2>/dev/null | head -3000)"
  [ -z "$files" ] && { echo "표본 없음"; return; }
  if [ "$OS" = mac ]; then res="$(printf '%s\n' "$files" | tr '\n' '\0' | xargs -0 stat -f '%z %b' 2>/dev/null | awk '$1>0 && $2==0 {c++} END{printf "%d %d", NR, c+0}')"
  else res="$(printf '%s\n' "$files" | tr '\n' '\0' | xargs -0 stat -c '%s %b' 2>/dev/null | awk '$1>0 && $2==0 {c++} END{printf "%d %d", NR, c+0}')"; fi
  echo "표본 ${res% *}개 중 내려받지 않은(클라우드 전용) 추정 ${res#* }개"
}
if [ ${#CLOUD_ROOTS[@]} -eq 0 ]; then
  p "- 감지된 클라우드 폴더 없음 (OneDrive / iCloud Drive / Dropbox / Google Drive)"
else
  for r in "${CLOUD_ROOTS[@]}"; do
    p ""
    p "### $(tilde "$r")"
    p "- 최상위 항목: $(ls -A "$r" 2>/dev/null | grep -v '^desktop.ini$' | head -25 | tr '\n' ',' | sed 's/,$//')"
    p "- $(sample_cloudonly "$r")"
  done
fi

# ── 3. git 레포 ────────────────────────────────────────────────────
say "[3/6] git 레포 상태 확인 ($(wc -l < "$TMP/repopaths.txt" | tr -d ' ')개)..."
RDIR="$TMP/repos"; mkdir -p "$RDIR"
repo_info() { # $1=경로 $2=번호
  local d="$1" n="$2" cloud=N note="" br url up dirty ahead behind hasup cmp last loc rem rc bad cx
  in_cloud "$d" && cloud=Y
  [ -f "$d/.git" ] && note="worktree/submodule;"
  br="$(git -C "$d" branch --show-current 2>/dev/null)"; [ -z "$br" ] && br="(detached)"
  url="$(git -C "$d" remote get-url origin 2>/dev/null | mask)"; [ -z "$url" ] && url="(원격 없음)"
  if [ "$DO_FETCH" = 1 ] && [ "$url" != "(원격 없음)" ]; then
    to 60 git -c gc.auto=0 -c maintenance.auto=0 -C "$d" fetch --quiet origin >/dev/null 2>&1
  fi
  up="$(git -C "$d" rev-parse --abbrev-ref '@{u}' 2>/dev/null)"
  dirty="$(to 30 git --no-optional-locks -C "$d" status --short 2>/dev/null | wc -l | tr -d ' ')"
  last="$(git -C "$d" log -1 --format=%cs 2>/dev/null)"
  if [ -n "$up" ]; then
    hasup=Y
    ahead="$(git -C "$d" rev-list --count "$up..HEAD" 2>/dev/null)"
    if [ "$DO_FETCH" = 1 ]; then behind="$(git -C "$d" rev-list --count "HEAD..$up" 2>/dev/null)"; else behind="?"; fi
  else
    hasup=N
    ahead="$(git -C "$d" rev-list --count HEAD --not --remotes 2>/dev/null)"
    behind="?"
  fi
  if [ "$NO_NET" = 1 ] || [ "$url" = "(원격 없음)" ] || [ "$br" = "(detached)" ]; then
    cmp="생략"
  else
    loc="$(git -C "$d" rev-parse HEAD 2>/dev/null)"
    rem="$(to 20 git -C "$d" ls-remote origin "refs/heads/$br" 2>/dev/null)"; rc=$?
    if [ $rc -ne 0 ]; then cmp="조회실패"
    elif [ -z "$rem" ]; then
      if [ "$hasup" = Y ]; then cmp="원격브랜치_삭제됨"; else cmp="원격에_브랜치_없음"; fi
    elif [ "$(printf '%s' "$rem" | cut -f1)" = "$loc" ]; then cmp="동일"
    else cmp="다름"; fi
  fi
  bad="$(git -C "$d" for-each-ref 2>&1 >/dev/null | grep -ciE 'broken ref|bad object|missing object')"
  [ "${bad:-0}" -gt 0 ] && note="${note}ref손상;"
  cx="$(git -C "$d" for-each-ref --format='%(refname)' 'refs/codex/*' 2>/dev/null | wc -l | tr -d ' ')"
  [ "${cx:-0}" -gt 0 ] && note="${note}codex-refs${cx};"
  printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n' \
    "$d" "$cloud" "$br" "$url" "${dirty:--}" "${ahead:--}" "$behind" "$hasup" "$cmp" "${last:--}" "${note:--}" > "$RDIR/$n.tsv"
}
n=0
while IFS= read -r d; do
  [ -z "$d" ] && continue
  n=$((n+1))
  while [ "$(jobs -r | wc -l | tr -d ' ')" -ge 6 ]; do sleep 0.3; done
  repo_info "$d" "$n" &
done < "$TMP/repopaths.txt"
wait
cat "$RDIR"/*.tsv 2>/dev/null | sort > "$TMP/all.tsv"

sec 30
p "## 3. git 레포 (${n}개)"
p ""
p "- 미커밋 = git status 변경 수 / 로컬에만 = 원격 어디에도 없는 커밋 수 / 뒤처짐 = ?는 확인 안 함(--fetch 때만 계산) / 원격HEAD = GitHub 같은 브랜치 HEAD와 비교"
p ""
p "| 경로 | 클라우드 | 브랜치 | 원격 | 미커밋 | 로컬에만 | 뒤처짐 | 업스트림 | 원격HEAD | 마지막커밋 | 비고 |"
p "|---|---|---|---|---|---|---|---|---|---|---|"
while IFS=$'\t' read -r path cloud br url dirty ahead behind hasup cmp last note; do
  p "| $(tilde "$path") | $cloud | $br | $url | $dirty | $ahead | $behind | $hasup | $cmp | $last | $note |"
done < "$TMP/all.tsv"

# ── 4. 같은 원격을 가리키는 중복 폴더 ───────────────────────────────
sec 40
p "## 4. 같은 GitHub 레포를 가리키는 폴더 (중복 후보)"
dups="$(awk -F'\t' '$4!="(원격 없음)" {u=tolower($4); sub(/\.git$/,"",u); sub(/\/$/,"",u); c[u]++; l[u]=l[u] "\n   - " $1 " (브랜치 " $3 ", 미커밋 " $5 ")"} END{for(k in c) if(c[k]>1) printf "- %s ×%d%s\n", k, c[k], l[k]}' "$TMP/all.tsv")"
if [ -z "$dups" ]; then p "- 없음"; else printf '%s\n' "$dups" | sed "s#$HOME#~#g" >> "$CUR"; fi

# ── 5. git 이 아닌 형제 폴더 (버전 관리 밖 프로젝트 후보) ────────────
say "[4/6] git 밖 폴더 확인..."
sec 50
p "## 5. 레포 옆에 있는 git 아닌 폴더 (버전 관리 밖 후보)"
sed 's#/[^/]*$##' "$TMP/repopaths.txt" | sort -u | grep -vx "$HOME" | head -8 > "$TMP/parents.txt"
if [ ! -s "$TMP/parents.txt" ]; then p "- 해당 없음"; fi
while IFS= read -r par; do
  [ -z "$par" ] && continue
  p ""
  p "### $(tilde "$par")"
  for sub in "$par"/*/; do
    [ -d "$sub" ] || continue
    s="${sub%/}"; name="${s##*/}"
    [ -e "$s/.git" ] && continue
    case "$name" in .*|node_modules|__pycache__) continue ;; esac
    cnt="$(to 40 find -H "$s" \( -name node_modules -o -name .venv -o -name venv -o -name .git -o -name .next \) -prune -o -type f -print 2>/dev/null | head -20000 | wc -l | tr -d ' ')"
    p "- $name — 파일 ${cnt}개 (git 아님)"
  done | head -40 >> "$CUR"
done < "$TMP/parents.txt"

# ── 6. 클라우드 안의 위험 요소 ──────────────────────────────────────
say "[5/6] 클라우드 폴더 안 위험 요소 정리..."
sec 60
p "## 6. 클라우드 폴더 안의 위험 요소"
cloud_deps=0; cloud_dep_kb=0
: > "$TMP/cdeps.txt"
while IFS= read -r f; do
  in_cloud "$f" || continue
  kb="$(du -sk "$f" 2>/dev/null | cut -f1)"; kb="${kb:-0}"
  cloud_deps=$((cloud_deps+1)); cloud_dep_kb=$((cloud_dep_kb+kb))
  printf '%s\t%s\n' "$kb" "$f" >> "$TMP/cdeps.txt"
done < "$TMP/deps.txt"
p "### 6-1. 의존성 폴더 (node_modules / .venv / venv / .next) — 기기마다 달라 동기화하면 안 되는 것"
p "- 개수 ${cloud_deps}개, 합계 약 $((cloud_dep_kb/1024)) MB (내려받지 않은 파일은 0으로 집계돼 실제보다 작게 보일 수 있음)"
sort -rn "$TMP/cdeps.txt" | head -6 | while IFS=$'\t' read -r kb f; do p "  - $((kb/1024)) MB  $(tilde "$f")"; done

p ""
p "### 6-2. 클라우드 안의 .claude 폴더 (설정/세션 폴더가 섞여 들어갔는지)"
found=0
while IFS= read -r f; do
  in_cloud "$f" || continue
  found=1
  trace=""
  for e in sessions history.jsonl shell-snapshots session-env plugins projects cache; do [ -e "$f/$e" ] && trace="$trace $e"; done
  if [ -n "$trace" ]; then p "- $(tilde "$f") — 🟡 기기 설정 폴더로 쓰인 흔적:$trace"; else p "- $(tilde "$f") — 프로젝트 설정만 있음"; fi
done < "$TMP/claudedirs.txt"
[ $found -eq 0 ] && p "- 없음"

p ""
p "### 6-3. 동기화 충돌본으로 의심되는 파일 (이름 패턴 기준, 정상 파일이 섞일 수 있음)"
c_all="$(grep -c . "$TMP/conflicts.txt" 2>/dev/null)"
if [ "${c_all:-0}" -eq 0 ]; then p "- 없음"; else
  head -30 "$TMP/conflicts.txt" | while IFS= read -r f; do p "- $(tilde "$f")"; done
  [ "$c_all" -gt 30 ] && p "- … 외 $((c_all-30))개"
fi

p ""
p "### 6-4. 비밀정보로 보이는 파일 위치 (내용은 읽지 않음, 이름만)"
s_cloud=0
: > "$TMP/s_list.txt"
while IFS= read -r f; do
  if in_cloud "$f"; then s_cloud=$((s_cloud+1)); echo "- 🔴 클라우드 안: $(tilde "$f")" >> "$TMP/s_list.txt"
  else echo "- 로컬: $(tilde "$f")" >> "$TMP/s_list.txt"; fi
done < "$TMP/secrets.txt"
if [ -s "$TMP/s_list.txt" ]; then head -40 "$TMP/s_list.txt" >> "$CUR"; else p "- 없음"; fi

# ── 7. AI 환경 (Claude / Codex) ─────────────────────────────────────
say "[6/6] AI 환경 확인..."
sec 70
p "## 7. AI 환경 (Claude Code / Codex)"
p "- claude: $(command -v claude 2>/dev/null || echo '없음') $(to 15 claude --version 2>/dev/null | head -1)"
p "- 환경변수: CLAUDE_CONFIG_DIR=${CLAUDE_CONFIG_DIR:-(없음)} / CODEX_HOME=${CODEX_HOME:-(없음)} / WORK_ROOT=${WORK_ROOT:-(없음)}"
CMD="$HOME/.claude/CLAUDE.md"
if [ -f "$CMD" ]; then p "- ~/.claude/CLAUDE.md: 있음 ($(wc -l < "$CMD" | tr -d ' ')줄, md5 $(md5of "$CMD"), 첫 줄: $(head -1 "$CMD" | cut -c1-60))"; else p "- ~/.claude/CLAUDE.md: 없음"; fi
if [ -f "$HOME/.claude/settings.json" ]; then
  p "- ~/.claude/settings.json (token/secret/key/password 포함 줄은 제외하고 표시):"
  p '```json'
  grep -viE 'token|secret|password|apikey|api_key|key"' "$HOME/.claude/settings.json" | head -40 >> "$CUR"
  p '```'
else p "- ~/.claude/settings.json: 없음"; fi
if command -v claude >/dev/null 2>&1; then
  p "- 설치된 플러그인:"
  p '```'
  to 40 claude plugin list 2>&1 | grep -E '❯|Version:|Scope:|Status:' | head -60 >> "$CUR"
  p '```'
  p "- 등록된 마켓플레이스:"
  p '```'
  to 40 claude plugin marketplace list 2>&1 | grep -E '❯|Source:' | head -20 >> "$CUR"
  p '```'
fi
if [ -d "$HOME/.claude/skills" ]; then p "- ~/.claude/skills: $(ls -A "$HOME/.claude/skills" 2>/dev/null | tr '\n' ' ')"; fi
if [ -d "$HOME/.claude/projects" ]; then
  p "- Claude로 작업했던 폴더(~/.claude/projects, 이 기기 기준 ${n}개 레포와 비교용):"
  ls -A "$HOME/.claude/projects" 2>/dev/null | head -40 | while IFS= read -r x; do p "  - $x"; done
  p "- 메모리 파일 수: $(ls "$HOME"/.claude/projects/*/memory/*.md 2>/dev/null | wc -l | tr -d ' ')개"
fi
if [ -d "$HOME/.codex" ]; then p "- ~/.codex: 있음 (AGENTS.md md5: $(md5of "$HOME/.codex/AGENTS.md"))"; else p "- ~/.codex: 없음"; fi

# ── 8. USB / 구 환경 흔적 ───────────────────────────────────────────
sec 80
p "## 8. USB · 구 환경 흔적"
usb=0
if [ "$OS" = mac ] && [ -d /Volumes ]; then p "- /Volumes: $(ls /Volumes 2>/dev/null | tr '\n' ',' | sed 's/,$//')"; fi
if [ -n "${WORK_ROOT:-}${CLAUDE_CONFIG_DIR:-}${CODEX_HOME:-}" ]; then usb=1; p "- 🟡 USB용 환경변수가 설정돼 있음 (env.sh 흔적)"; fi
for r in "${CLOUD_ROOTS[@]}"; do
  hit="$(to 30 find -H "$r" -maxdepth 3 \( -name 'WorkSpace_M' -o -name '_global' -o -name 'env.sh' -o -name 'bootstrap.sh' \) 2>/dev/null | head -5)"
  if [ -n "$hit" ]; then usb=1; printf '%s\n' "$hit" | while IFS= read -r h; do p "- 🟡 구 환경 파일/폴더: $(tilde "$h")"; done; fi
done
[ $usb -eq 0 ] && p "- 흔적 없음"

# ── 요약 (맨 앞) ───────────────────────────────────────────────────
sec 05
total="$(grep -c . "$TMP/all.tsv" 2>/dev/null)"; total="${total:-0}"
incloud="$(awk -F'\t' '$2=="Y"' "$TMP/all.tsv" | grep -c .)"
noup="$(awk -F'\t' '$8=="N"' "$TMP/all.tsv" | grep -c .)"
unpushed="$(awk -F'\t' '$6+0>0' "$TMP/all.tsv" | grep -c .)"
dirtyc="$(awk -F'\t' '$5+0>0' "$TMP/all.tsv" | grep -c .)"
differ="$(awk -F'\t' '$9=="다름"' "$TMP/all.tsv" | grep -c .)"
badref="$(awk -F'\t' '$11 ~ /ref손상/' "$TMP/all.tsv" | grep -c .)"
p "## 0. 요약 (자동 판정)"
p ""
p "| 판정 | 항목 | 값 |"
p "|---|---|---|"
p "| ℹ️ | git 레포 수 | ${total} |"
p "| $([ "${incloud:-0}" -gt 0 ] && echo 🔴 || echo 🟢) | 클라우드 동기화 폴더 안에 있는 레포 | ${incloud:-0} |"
p "| $([ "${noup:-0}" -gt 0 ] && echo 🔴 || echo 🟢) | 업스트림 없는 브랜치 (로컬 전용일 수 있음) | ${noup:-0} |"
p "| $([ "${unpushed:-0}" -gt 0 ] && echo 🔴 || echo 🟢) | 원격에 없는 커밋이 있는 레포 | ${unpushed:-0} |"
p "| $([ "${dirtyc:-0}" -gt 0 ] && echo 🟡 || echo 🟢) | 미커밋 변경이 있는 레포 | ${dirtyc:-0} |"
p "| $([ "${differ:-0}" -gt 0 ] && echo 🟡 || echo 🟢) | GitHub와 HEAD가 다른 레포 (뒤처짐/앞섬) | ${differ:-0} |"
p "| $([ "${badref:-0}" -gt 0 ] && echo 🔴 || echo 🟢) | git ref 손상 레포 | ${badref:-0} |"
p "| $([ "${s_cloud:-0}" -gt 0 ] && echo 🔴 || echo 🟢) | 클라우드 안 비밀정보 의심 파일 | ${s_cloud:-0} |"
p "| $([ "${c_all:-0}" -gt 0 ] && echo 🟡 || echo 🟢) | 동기화 충돌본 의심 파일 | ${c_all:-0} |"
p "| $([ "${usb}" -gt 0 ] && echo 🟡 || echo 🟢) | USB·구 환경 흔적 | ${usb} |"

# ── 조립 ───────────────────────────────────────────────────────────
sec 01
p "# 작업환경 점검 결과 — ${HOST} (${OS}) — $(date '+%Y-%m-%d %H:%M')"
p ""
p "> 읽기 전용 점검 결과입니다. 비밀 내용은 포함되지 않지만(경로만), 외부에 공유하기 전에 폴더·레포 이름을 한 번 확인하세요."
p ""
{ for f in $(ls "$SEC" | sort); do cat "$SEC/$f"; echo; done; } > "$OUT"
cat "$OUT"
say ""
say "저장됨: $OUT"
