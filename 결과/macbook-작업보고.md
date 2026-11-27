# 맥북 작업 보고 — 2026-11-27

> 근거: [기기별-작업지시.md](../기기별-작업지시.md) 맥북 칸, [맥북-작업지시.md](../맥북-작업지시.md) 1-1~1-3. 10월 복사본 삭제(2번)는 **하지 않았습니다.**

## 0. 먼저 알려드릴 것 — 지시서보다 먼저 한 일과 되돌림
지시서(04:28~04:38)가 올라오기 전에 맥북에서 아래를 이미 했습니다. 공통 규칙 1(iCloud 안 변경 금지)에 맞춰 **되돌렸습니다.**

| 한 일 | 지금 상태 |
|---|---|
| iCloud `WorkSpace_M` 프로젝트 `.env` 4개(`toss-autotrader`, `mini/competitor-monitoring-agent`, `url-shortener`, `carenote-ai`)를 `~/dev/_secrets`로 이동 | **원래 위치로 되돌림** (권한만 600으로 바뀜) |
| `_global/codex/auth.json`, `_global/claude/.claude.json`, `_global/claude/backups/`(5개)를 휴지통으로 이동 | **원래 위치로 되돌림** |
| court 스킬: iCloud `_global`에서 `feat/court-skill` 브랜치 커밋 → `main`에 fast-forward 머지·push (`a6ce92c`) | 그대로 유지(되돌리려면 force push가 필요해 하지 않음). 작업 중 `_global`이 잠시 `feat/court-skill` 브랜치였고 지금은 `main` |
| `~/Documents/Codex/2026-08-24/new-chat/seoul-air-station-analysis`(iCloud Documents, `WorkSpace_M` 밖)를 `~/dev/seoul-air-station-analysis`로 이동, 원본은 휴지통 | 유지 (`.env` 1개: `SEOUL_API_KEY` 등 키 2개) |

## 1. 맥북-작업지시 1-1 원격에 없는 커밋
10월 복사본 21개 레포 모두 **0**. (`--fetch` 재점검 `결과/skywith-MacBook-Pro-20261127-0418.md`: "GitHub와 다름" 22개는 전부 뒤처짐, 앞섬 0)

## 2. 맥북-작업지시 1-2 실제 미커밋 변경
- `_repos/*` 14개: 실제 변경 0(모드·줄바꿈뿐) → **통과**
- 실제 변경이 있는 7개는 `backup/mac-oct-copy` 브랜치로 push. 작업 폴더·브랜치는 바꾸지 않고 임시 index로 커밋했습니다. `.env`·키·`node_modules`·50MB 초과 파일 없음 확인.

| 레포 (10월 복사본 `WorkSpace/…`) | 원래 브랜치 | 실제 변경 (줄바꿈 무시) | push 커밋 |
|---|---|---|---|
| `claude/oblige` | main | 수정 4 + 미추적 3 (`agent_claude/gemini/tools.py`) | `bd7a5fc` ※ |
| `claude/toss-llm-trader` | main | 수정 3 + 미추적 1 (`tests/test_universe.py`) | `edc374e` |
| `claude/CodeSage` | deploy/oracle-cloud | 수정 2 + 미추적 3 (Caddyfile, docker-compose.prod.yml, docs/deploy-oracle.md) | `b103b22` |
| `claude/todo-list` | main | README 1 | `b8b8d6c` ※ |
| `claude/jabis` | master | README 1 | `56e041c` |
| `claude/checkmate` | test/git | README 1 | `494d26c` |
| `케어노트AI` (→ `carenote-ai` 레포) | main | 문서·pptx 삭제 17 + 미추적 25 (`.work/`, `.chart-data-*/`) | `d6b0687` |

※ oblige(152파일)·todo-list(28파일) 커밋에는 줄바꿈 차이도 함께 들어갔습니다. 실제 내용 변경은 위 표의 숫자입니다.
- 별도로 로컬 백업도 있음: `~/dev/_backup/macbook-oct-copy-20261127/` (patch + 파일 실물, `git apply --check` 통과)
- CodeSage `deploy/oracle-cloud` 브랜치 자체는 GitHub에 없지만 그 커밋은 `main`에 포함돼 있음(원격에 없는 커밋 0)
- 케어노트AI의 `.git`은 `~/.gitdirs/carenote-ai.git`(클라우드 밖)를 가리킴

## 3. 맥북-작업지시 1-3 git 밖 폴더 파일 목록
[맥북-10월복사본-파일목록.txt](맥북-10월복사본-파일목록.txt) — 3,452줄 (경로+크기, 내용 없음)

| 폴더 | 파일 수 |
|---|---|
| claude/KU_8 | 196 |
| claude/cosmetic-agent | 3,245 (`.env` 1개 포함) |
| claude/blog | 2 |
| claude/social-previews | 8 |
| Codex | 1 |

## 4. carenote-ai (iCloud `WorkSpace_M/projects/carenote-ai`, 브랜치 `v2`)
- 미커밋 16개는 **실제 내용 변경**(삭제 표시 아님) → `wip/carenote-20261127`로 push (`36485f5` ← `06ac2f1`). `v2` 작업 폴더·브랜치는 그대로.
  - 수정 4: `docs/stt-design.md`, `src/carenote/evaluation/stt_eval.py`, `stt_metrics.py`, `tests/test_stt_eval.py`
  - 미추적: `docs/design/`(19), `docs/reports/`(3), `_archive/케어노트AI-v1/`(165, 약 18MB), **충돌본 `src/carenote/orchestration/graph 2.py`**(10-28, `graph.py`와 내용 다름 — 비교 필요)
- 커밋 객체가 iCloud 안 `.git`에 추가된 것 외에 이동·이름 변경 없음.

## 5. court 스킬
- `~/dev/workenv`에 새로 clone, `claude/skills/court`가 `main`(`a6ce92c`)에 이미 있고 로컬과 일치. 그래서 `add-court-skill` 브랜치는 따로 만들지 않았습니다(원격에 `feat/court-skill` 브랜치 남아 있음).
- 내용: 외부 MIT 스킬 [alexyc9381/court-skill](https://github.com/alexyc9381/court-skill) v1.0.0 (`SKILL.md`, `court.py`, `jurors.json`). 아이디어를 검사·변호·배심원 12명·판사 역할 Claude로 토론시켜 판정. **비밀정보 없음**(URL은 출처 표기뿐).

## 6. OneDrive 경로
- `~/OneDrive - 인덕대학교` → `~/Library/CloudStorage/OneDrive-인덕대학교`로 가는 **링크(symlink)**. 실제 폴더는 2개: 현재 OneDrive, 10월 22일 복사본.

## 7. 그 밖에 확인한 것
- 맥북 `~/.claude/skills` 11개 중 court 외 10개와 `CLAUDE.md`는 `workenv`와 동일.
- iCloud `Documents` 동기화가 켜져 있음(`~/Documents`가 iCloud).
- `~/dev/persona-ize`는 GitHub보다 30커밋 뒤처짐, 미커밋 0 (노트북 담당이라 건드리지 않음).
- 휴지통: `seoul-air-station-analysis-icloud-20261127`(원본), `workspace_m-global-auth-20261127`(빈 폴더).

## 8. 하지 않은 것
- 10월 복사본 삭제 — 데스크탑의 USB 백업 + 파일 목록 대조 결과를 기다림
- OneDrive 중단, iCloud 안 이동·삭제·이름 변경

## 9. 추가 (11-27, 데스크탑 대조 결과 반영) — 맥북-작업지시 5번
- **공개 레포 브랜치 사고 확인**: 맥북이 push한 `backup/mac-oct-copy` 7개·`wip/carenote-20261127`은 데스크탑이 삭제했고, 맥북에서 `git ls-remote`로 7개 레포 모두 backup·wip 브랜치 0개를 확인. push 전 공개 여부를 확인하지 않은 것은 맥북 쪽 누락. 내용은 `~/dev/_backup/macbook-oct-copy-20261127/`·10월 복사본·iCloud carenote-ai 작업 폴더에 남아 있어 손실 없음.
- **KU_8 31개 복사**: iCloud `강의자료/KU_8-맥북복사본/`(새 폴더, `WorkSpace_M` 밖)에 `claude/KU_8/` 아래 구조를 유지해 복사. **31개 모두 크기가 목록과 같고 원본과 바이트 단위로 동일**(`cmp`). 합계 56MB. 원본은 그대로 둠.
- **carenote-ai 태그 4개 push**: `golden-v2-final-plan`, `golden-v2-frozen`, `golden-v2-test-reported`, `sentinel-rules-v2` (레포 PUBLIC 확인. 4개 모두 이미 공개된 `origin/v2`에 포함된 커밋을 가리켜서 새로 공개되는 코드는 없음. 주석 태그라 태그 메시지는 공개됨). iCloud 사본 삭제 조건 충족.
- **남은 것**: 10월 복사본 삭제(2번)는 사용자 확인 후. 그 다음 [플러그인-설치-지침.md](../플러그인-설치-지침.md).
