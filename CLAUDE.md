# env-check — 3대 기기 작업환경 점검·통일
mode: work

데스크탑(HOME, 이 PC) · 맥북 · 노트북의 폴더·git·클라우드를 같은 방식으로 점검하고, GitHub(코드) + 로컬 `~/dev` + iCloud(문서)로 통일하는 프로젝트. 이 레포는 **private**.

## 먼저 읽을 것 (순서대로)
1. [인수인계.md](인수인계.md) — 현재 상태와 **가장 먼저 결정할 것**
2. [할일.md](할일.md) — 결정·우선순위·보류 항목
3. [통일계획-초안.md](통일계획-초안.md), [활용가이드.md](활용가이드.md), [기기별-작업지시.md](기기별-작업지시.md)

## 규칙
| 규칙 | 이유 |
|---|---|
| 점검은 **읽기 전용**. 지우지 않고 백업 폴더·로컬 브랜치로 보존. `reset --hard`·force push 금지 | 되돌릴 수 있어야 함 |
| **작업 대상 레포 대부분이 PUBLIC.** push 전에 `gh repo view SkyWith628/<이름> --json visibility` 확인, 공개 레포에는 WIP를 올리지 않음 | 11-27에 공개 레포 8곳에 backup·wip 브랜치가 올라간 사고가 있었음(인수인계 1번) |
| iCloud `WorkSpace_M` 안에서 이동·삭제·이름 변경 금지(읽기만) | 3대가 공유, 동기화가 고르지 않아 충돌본 발생 |
| 커밋·push는 사용자가 요청할 때만. 비밀값(`.env`·키) 내용은 읽거나 출력하지 않음 | 클라우드 안 `.env`·인증 파일이 이미 22개 |
| `결과/`는 git에서 무시됨. 올릴 때만 `git add -f 결과/<자기 파일>` | 경로에 학교 문서 이름 포함 |

## 명령
- 점검: `bash check-env.sh [--no-net] [--fetch] [--name 영문이름]` → `결과/<기기>-<시각>.md`
- USB 백업 마무리(증분·검증·README): `pwsh -NoProfile -File scripts\finish-backup.ps1`
- Windows 기본값 `core.autocrlf=true`라 미커밋 수가 부풀 수 있음 → `check-env.sh`의 "실제변경" 열 사용

## 기기
데스크탑 `C:\Users\gkfkd\dev\env-check`(학교 OneDrive 전체 보유, D: USB 백업 담당) / 맥북 `~/dev/env-check` / 노트북 `~/dev/env-check`
