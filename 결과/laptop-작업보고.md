# 노트북 작업 보고 — 2026-11-27

> [기기별-작업지시.md](../기기별-작업지시.md) "노트북" 칸 기준. iCloud `WorkSpace_M` 안은 이동·삭제·이름 변경을 하지 않았습니다(읽기와 복사만).
> 일부 작업은 지시서가 나오기 전에 [통일계획-초안.md](../통일계획-초안.md) 노트북 단계 0·2에 따라 먼저 했습니다. 지시서와 다른 점은 3번에 적었습니다.

## 1. 지시서 항목별 결과
### 1-1. `persona-ize` 미커밋 1건 — 완료
- 내용: 미추적 파일 `scripts/kakao_replay.py`(7KB) 1개. 대본(`HH:MM:SS|화자|본문`)을 PC 카카오톡 채팅창에 시각 맞춰 보내는 Windows 전용 스크립트. 비밀정보로 보이는 문자열 없음.
- **브랜치 `feat/kakao-replay`로 push**(커밋 `4191104`). 지시서의 브랜치 이름 `wip/persona-laptop-20261127`과 다릅니다(지시서 전에 올림). PR은 만들지 않았습니다.
- 그 뒤 로컬 `main`을 GitHub에 맞춤(`fbd5221` → `d8bf96b`, fast-forward). 지금 `persona-ize`는 미커밋 0입니다.

### 1-2. iCloud `projects/MINI`, `projects/mini(1)` — 읽기만 함
| 폴더 | `.env` | `.venv` | 그 밖 | git 상태 |
|---|---|---|---|---|
| `projects/MINI` | 없음 | 없음 | 코드만 (`.env.example`) | 미커밋 0, 로컬에만 0, 마지막 커밋 11/19, GitHub보다 **뒤처짐** |
| `projects/mini(1)/competitor-monitoring-agent` | **있음** (gitignore됨) | 있음 | `data/monitor.db`(86KB, gitignore됨), `egg-info`, `__pycache__` | 추적 파일 128개 중 사라진 것 0, 미추적 0, 로컬에만 0, 마지막 커밋 11/24, GitHub보다 **뒤처짐** |
| `projects/mini(1)` | – | – | `.vscode`만 | – |
| `WorkSpace_M/1` | – | – | 빈 폴더 | – |

- `mini(1)`은 `git status`가 내려받지 않은 파일에서 읽기 오류(`Invalid argument`)를 내며 멈춰서, 파일 목록 비교(`ls-files --deleted/--others`)로 대신 확인했습니다. 추적 파일의 **내용 변경 여부는 확인하지 못했습니다.**
- 두 폴더 모두 GitHub에 없는 커밋은 0이라, 지킬 것은 `mini(1)`의 `.env`와 `data/monitor.db`뿐입니다. 이 두 파일은 `~/dev/competitor-monitoring-agent`에 복사해 두었습니다(아래 2번).

### 1-3. `carenote-ai` fsck — ref 손상 아님
| 대상 | 결과 |
|---|---|
| iCloud `projects/carenote-ai` | 전체 `fsck`는 150초 시간 초과(객체를 iCloud에서 내려받는 중으로 추정). `for-each-ref` 오류 **0**, `fsck --connectivity-only` **통과**(dangling 객체 4개뿐, 정상) |
| 새 clone `~/dev/carenote-ai` | `fsck` 통과 |

- 첫 점검(03:52)의 `ref손상`은 재점검(04:04)과 이번 확인에서 재현되지 않아 **일시적(iCloud 내려받기 중)으로 판단**합니다.
- ⚠️ **iCloud 사본에만 있는 태그 4개**: `golden-v2-final-plan`, `golden-v2-frozen`, `golden-v2-test-reported`, `sentinel-rules-v2`. 가리키는 커밋은 모두 GitHub에 있지만 **태그 자체는 GitHub에 없습니다.** iCloud 사본을 지우기 전에 `git push origin --tags`가 필요합니다. `carenote-ai`는 맥북 담당이라 노트북에서는 push하지 않았습니다.

## 2. 지시서 밖에서 한 것 (로컬에만, push 없음)
`~/dev`에 GitHub에서 새로 clone했습니다. iCloud 원본은 그대로입니다.

| 레포 | 브랜치 | iCloud 사본과 비교 | 복사한 파일 (gitignore 확인, 내용은 열지 않음) |
|---|---|---|---|
| workenv | main `a6ce92c` | 새 clone이 앞섬(iCloud 커밋 포함) | – |
| competitor-monitoring-agent | main `9229ec8` | 새 clone이 앞섬(iCloud 커밋 포함) | `.env`, `data/monitor.db` (`mini(1)`에서) |
| carenote-ai | v2 `06ac2f1` | 같음 | `.env` |
| url-shortener | master `e0d5343` | 같음 | `.env` |

- `carenote-ai`·`workenv`는 지시서상 데스크탑·맥북 담당 레포지만, 노트북에서는 clone만 했고 커밋·push는 하지 않았습니다.
- iCloud 안 `.env`는 복사만 했고 지우지 않았습니다.

## 3. 하지 않은 것
- Claude 환경 설정(CLI·`workenv` 설치·플러그인) — 사용자가 나중에 한 번에 하기로 함. 참고로 `workenv`의 `bootstrap.sh`는 USB용이라 `~/dev`에서 돌리면 `~/dev/projects`·`~/dev/shared`를 만들고, `sync.sh`는 노트북 Git Bash에 `rsync`가 없어 스킬 복사 단계에서 멈춥니다(데스크탑 단계 4에서 반영 필요).
- iCloud 안 이동·삭제·이름 변경, OneDrive 관련 작업.

## 4. 데스크탑에 전할 것
1. `carenote-ai` 태그 4개가 GitHub에 없음 → 맥북(담당)에서 `git push origin --tags` 후 iCloud 사본 정리.
2. 노트북 `persona-ize` 브랜치 이름은 `feat/kakao-replay`(지시서의 `wip/…`가 아님).
3. `MINI`·`mini(1)`·`1`은 지킬 것이 `.env`·`monitor.db`뿐이고 이미 `~/dev`에 복사함 → 세 기기 확인 후 정리할 때 노트북 쪽은 준비 완료.
4. `workenv` 설치 스크립트: Windows에서 `rsync` 없이 동작하게, USB 경로 가정(`../projects`) 제거.
