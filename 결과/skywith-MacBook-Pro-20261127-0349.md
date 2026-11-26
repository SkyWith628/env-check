# 작업환경 점검 결과 — skywith-MacBook-Pro (mac) — 2026-11-27 03:50

> 읽기 전용 점검 결과입니다. 비밀 내용은 포함되지 않지만(경로만), 외부에 공유하기 전에 폴더·레포 이름을 한 번 확인하세요.


## 0. 요약 (자동 판정)

| 판정 | 항목 | 값 |
|---|---|---|
| ℹ️ | git 레포 수 | 68 |
| 🔴 | 클라우드 동기화 폴더 안에 있는 레포 | 66 |
| 🔴 | 업스트림 없는 브랜치 (로컬 전용일 수 있음) | 39 |
| 🟢 | 원격에 없는 커밋이 있는 레포 | 0 |
| 🟡 | 미커밋 변경이 있는 레포 | 19 |
| 🟡 | GitHub와 HEAD가 다른 레포 (뒤처짐/앞섬) | 22 |
| 🔴 | git ref 손상 레포 | 10 |
| 🔴 | 클라우드 안 비밀정보 의심 파일 | 42 |
| 🟡 | 동기화 충돌본 의심 파일 | 38 |
| 🟡 | USB·구 환경 흔적 | 1 |

## 1. 기기 정보
- 호스트: skywith-MacBook-Pro
- 사용자: sktwith
- OS: Darwin 27.3.0 (구분: mac)
- HOME: /Users/sktwith
- 모델: Mac15,3 / macOS 27.3
- git: git version 2.54.0 (Apple Git-157) / core.autocrlf=
- 점검: check-env.sh v1.0, 2026-11-27 03:49, 옵션 no-net=0 fetch=0

## 2. 클라우드 동기화 폴더

### ~/OneDrive - 인덕대학교
- 최상위 항목: .849C9593-D756-4E56-8D6E-42412F2A707B,.DS_Store,.Trash,1학년 1학기,,WorkSpace,기타 자료도 총학,2학년 1학기,2학년 2학기,3학년 1학기,Icon
- 표본 1298개 중 내려받지 않은(클라우드 전용) 추정 855개

### ~/Library/CloudStorage/OneDrive-인덕대학교
- 최상위 항목: .849C9593-D756-4E56-8D6E-42412F2A707B,.DS_Store,.Trash,1학년 1학기,,WorkSpace,기타 자료도 총학,2학년 1학기,2학년 2학기,3학년 1학기,Icon
- 표본 1298개 중 내려받지 않은(클라우드 전용) 추정 855개

### ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)
- 최상위 항목: .849C9593-D756-4E56-8D6E-42412F2A707B,.DS_Store,1학년 1학기,1학년 2,WorkSpace,기타 자료,3학년 1학기,Icon
- 표본 3000개 중 내려받지 않은(클라우드 전용) 추정 0개

### ~/Library/Mobile Documents/com~apple~CloudDocs
- 최상위 항목: .DS_Store,Desktop,Documents,Downloads,TalkFile_KakaoTalk_20261119_0907_28_185_KU_8기 이유정.txt,WorkSpace_M,s_MobilePrdInfoPdfDown.json.pdf,skywith,강의자료
- 표본 2692개 중 내려받지 않은(클라우드 전용) 추정 316개

## 3. git 레포 (68개)

- 미커밋 = git status 변경 수 / 로컬에만 = 원격 어디에도 없는 커밋 수 / 뒤처짐 = ?는 확인 안 함(--fetch 때만 계산) / 원격HEAD = GitHub 같은 브랜치 HEAD와 비교

| 경로 | 클라우드 | 브랜치 | 원격 | 미커밋 | 로컬에만 | 뒤처짐 | 업스트림 | 원격HEAD | 마지막커밋 | 비고 |
|---|---|---|---|---|---|---|---|---|---|---|
| ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/ClauseMate | Y | main | https://github.com/SkyWith628/clausemate.git | 2 | 0 | ? | Y | 동일 | 2026-06-18 | - |
| ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/CodeSage | Y | deploy/oracle-cloud | https://github.com/SkyWith628/codesage.git | 5 | 0 | ? | N | 원격에_브랜치_없음 | 2026-06-15 | - |
| ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/SkyWith628 | Y | main | https://github.com/SkyWith628/SkyWith628.git | 0 | 0 | ? | Y | 다름 | 2026-06-15 | - |
| ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/_repos/Data_Analysis_Python | Y | main | https://github.com/SkyWith628/Data_Analysis_Python.git | 11 | 0 | ? | Y | 다름 | 2026-06-16 | - |
| ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/_repos/SkyWith628 | Y | main | https://github.com/SkyWith628/SkyWith628.git | 0 | 0 | ? | Y | 다름 | 2026-06-16 | - |
| ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/_repos/checkmate | Y | master | https://github.com/SkyWith628/checkmate.git | 118 | 0 | ? | Y | 다름 | 2026-06-16 | - |
| ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/_repos/codesage | Y | main | https://github.com/SkyWith628/codesage.git | 47 | 0 | ? | Y | 다름 | 2026-06-16 | - |
| ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/_repos/ios-practice | Y | main | https://github.com/SkyWith628/ios-practice.git | 0 | 0 | ? | Y | 동일 | 2026-06-16 | - |
| ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/_repos/jabis | Y | master | https://github.com/SkyWith628/jabis.git | 26 | 0 | ? | Y | 다름 | 2026-06-16 | - |
| ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/_repos/jikgugom | Y | main | https://github.com/SkyWith628/jikgugom.git | 0 | 0 | ? | Y | 다름 | 2026-06-16 | - |
| ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/_repos/kospi-exchange-analysis | Y | main | https://github.com/SkyWith628/kospi-exchange-analysis.git | 0 | 0 | ? | Y | 다름 | 2026-06-16 | - |
| ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/_repos/oblige | Y | main | https://github.com/SkyWith628/oblige.git | 73 | 0 | ? | Y | 다름 | 2026-06-16 | - |
| ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/_repos/todo-list | Y | main | https://github.com/SkyWith628/todo-list.git | 29 | 0 | ? | Y | 다름 | 2026-06-16 | - |
| ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/_repos/unity-game-basics | Y | main | https://github.com/SkyWith628/unity-game-basics.git | 0 | 0 | ? | Y | 동일 | 2026-06-16 | - |
| ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/checkmate | Y | test/git | https://github.com/SkyWith628/checkmate.git | 1 | 0 | ? | Y | 원격브랜치_삭제됨 | 2026-06-21 | - |
| ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/jabis | Y | master | https://github.com/SkyWith628/jabis.git | 1 | 0 | ? | Y | 다름 | 2026-06-10 | - |
| ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/oblige | Y | main | https://github.com/SkyWith628/oblige.git | 152 | 0 | ? | Y | 다름 | 2026-06-20 | - |
| ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/sourcing-agent | Y | main | https://github.com/SkyWith628/jikgugom.git | 0 | 0 | ? | Y | 다름 | 2026-08-18 | - |
| ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/todo-list | Y | main | https://github.com/SkyWith628/todo-list.git | 28 | 0 | ? | Y | 다름 | 2026-06-10 | - |
| ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/toss-llm-trader | Y | main | https://github.com/SkyWith628/toss-llm-trader.git | 4 | 0 | ? | Y | 다름 | 2026-08-22 | - |
| ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/케어노트AI | Y | main | https://github.com/SkyWith628/carenote-ai.git | 20 | 0 | ? | Y | 다름 | 2026-10-01 | worktree/submodule; |
| ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/ClauseMate | Y | main | https://github.com/SkyWith628/clausemate.git | 0 | - | ? | Y | 동일 | - | ref손상; |
| ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/CodeSage | Y | (detached) | https://github.com/SkyWith628/codesage.git | 60 | - | ? | N | 생략 | - | ref손상; |
| ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/SkyWith628 | Y | (detached) | (원격 없음) | 0 | - | ? | N | 생략 | - | - |
| ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/_repos/Data_Analysis_Python | Y | (detached) | (원격 없음) | 0 | - | ? | N | 생략 | - | - |
| ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/_repos/SkyWith628 | Y | (detached) | (원격 없음) | 0 | - | ? | N | 생략 | - | - |
| ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/_repos/checkmate | Y | (detached) | (원격 없음) | 0 | - | ? | N | 생략 | - | - |
| ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/_repos/codesage | Y | (detached) | (원격 없음) | 0 | - | ? | N | 생략 | - | - |
| ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/_repos/ios-practice | Y | (detached) | (원격 없음) | 0 | - | ? | N | 생략 | - | - |
| ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/_repos/jabis | Y | (detached) | (원격 없음) | 0 | - | ? | N | 생략 | - | - |
| ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/_repos/jikgugom | Y | (detached) | (원격 없음) | 0 | - | ? | N | 생략 | - | - |
| ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/_repos/kospi-exchange-analysis | Y | (detached) | (원격 없음) | 0 | - | ? | N | 생략 | - | - |
| ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/_repos/oblige | Y | (detached) | (원격 없음) | 0 | - | ? | N | 생략 | - | - |
| ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/_repos/todo-list | Y | (detached) | (원격 없음) | 0 | - | ? | N | 생략 | - | - |
| ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/_repos/unity-game-basics | Y | (detached) | (원격 없음) | 0 | - | ? | N | 생략 | - | - |
| ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/checkmate | Y | (detached) | https://github.com/SkyWith628/checkmate.git | 0 | - | ? | N | 생략 | - | ref손상; |
| ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/jabis | Y | (detached) | (원격 없음) | 0 | - | ? | N | 생략 | - | - |
| ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/oblige | Y | (detached) | https://github.com/SkyWith628/oblige.git | 0 | - | ? | N | 생략 | - | ref손상; |
| ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/sourcing-agent | Y | main | https://github.com/SkyWith628/jikgugom.git | 0 | - | ? | Y | 다름 | - | ref손상; |
| ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/todo-list | Y | (detached) | (원격 없음) | 0 | - | ? | N | 생략 | - | - |
| ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/toss-llm-trader | Y | main | https://github.com/SkyWith628/toss-llm-trader.git | 0 | - | ? | N | 다름 | - | - |
| ~/Library/Mobile Documents/com~apple~CloudDocs/WorkSpace_M/_global | Y | main | https://github.com/SkyWith628/workenv.git | 0 | 0 | ? | Y | 동일 | 2026-10-22 | - |
| ~/Library/Mobile Documents/com~apple~CloudDocs/WorkSpace_M/_global/codex/.tmp/plugins-clone-PzKHC9 | Y | main | (원격 없음) | 4 | - | ? | N | 생략 | - | codex-refs1; |
| ~/Library/Mobile Documents/com~apple~CloudDocs/WorkSpace_M/projects/carenote-ai | Y | v2 | https://github.com/SkyWith628/carenote-ai.git | 16 | 0 | ? | N | 동일 | 2026-10-28 | - |
| ~/Library/Mobile Documents/com~apple~CloudDocs/WorkSpace_M/projects/mini/competitor-monitoring-agent | Y | main | https://github.com/SkyWith628/competitor-monitoring-agent | 1 | 0 | ? | Y | 다름 | 2026-11-24 | - |
| ~/Library/Mobile Documents/com~apple~CloudDocs/WorkSpace_M/projects/url-shortener | Y | master | https://github.com/SkyWith628/url-shortener.git | 0 | 0 | ? | Y | 동일 | 2026-11-15 | - |
| ~/OneDrive - 인덕대학교/WorkSpace/claude/ClauseMate | Y | main | https://github.com/SkyWith628/clausemate.git | 0 | - | ? | Y | 동일 | - | ref손상; |
| ~/OneDrive - 인덕대학교/WorkSpace/claude/CodeSage | Y | (detached) | https://github.com/SkyWith628/codesage.git | 60 | - | ? | N | 생략 | - | ref손상; |
| ~/OneDrive - 인덕대학교/WorkSpace/claude/SkyWith628 | Y | (detached) | (원격 없음) | 0 | - | ? | N | 생략 | - | - |
| ~/OneDrive - 인덕대학교/WorkSpace/claude/_repos/Data_Analysis_Python | Y | (detached) | (원격 없음) | 0 | - | ? | N | 생략 | - | - |
| ~/OneDrive - 인덕대학교/WorkSpace/claude/_repos/SkyWith628 | Y | (detached) | (원격 없음) | 0 | - | ? | N | 생략 | - | - |
| ~/OneDrive - 인덕대학교/WorkSpace/claude/_repos/checkmate | Y | (detached) | (원격 없음) | 0 | - | ? | N | 생략 | - | - |
| ~/OneDrive - 인덕대학교/WorkSpace/claude/_repos/codesage | Y | (detached) | (원격 없음) | 0 | - | ? | N | 생략 | - | - |
| ~/OneDrive - 인덕대학교/WorkSpace/claude/_repos/ios-practice | Y | (detached) | (원격 없음) | 0 | - | ? | N | 생략 | - | - |
| ~/OneDrive - 인덕대학교/WorkSpace/claude/_repos/jabis | Y | (detached) | (원격 없음) | 0 | - | ? | N | 생략 | - | - |
| ~/OneDrive - 인덕대학교/WorkSpace/claude/_repos/jikgugom | Y | (detached) | (원격 없음) | 0 | - | ? | N | 생략 | - | - |
| ~/OneDrive - 인덕대학교/WorkSpace/claude/_repos/kospi-exchange-analysis | Y | (detached) | (원격 없음) | 0 | - | ? | N | 생략 | - | - |
| ~/OneDrive - 인덕대학교/WorkSpace/claude/_repos/oblige | Y | (detached) | (원격 없음) | 0 | - | ? | N | 생략 | - | - |
| ~/OneDrive - 인덕대학교/WorkSpace/claude/_repos/todo-list | Y | (detached) | (원격 없음) | 0 | - | ? | N | 생략 | - | - |
| ~/OneDrive - 인덕대학교/WorkSpace/claude/_repos/unity-game-basics | Y | (detached) | (원격 없음) | 0 | - | ? | N | 생략 | - | - |
| ~/OneDrive - 인덕대학교/WorkSpace/claude/checkmate | Y | (detached) | https://github.com/SkyWith628/checkmate.git | 0 | - | ? | N | 생략 | - | ref손상; |
| ~/OneDrive - 인덕대학교/WorkSpace/claude/jabis | Y | (detached) | (원격 없음) | 0 | - | ? | N | 생략 | - | - |
| ~/OneDrive - 인덕대학교/WorkSpace/claude/oblige | Y | (detached) | https://github.com/SkyWith628/oblige.git | 0 | - | ? | N | 생략 | - | ref손상; |
| ~/OneDrive - 인덕대학교/WorkSpace/claude/sourcing-agent | Y | main | https://github.com/SkyWith628/jikgugom.git | 0 | - | ? | Y | 다름 | - | ref손상; |
| ~/OneDrive - 인덕대학교/WorkSpace/claude/todo-list | Y | (detached) | (원격 없음) | 0 | - | ? | N | 생략 | - | - |
| ~/OneDrive - 인덕대학교/WorkSpace/claude/toss-llm-trader | Y | main | https://github.com/SkyWith628/toss-llm-trader.git | 0 | - | ? | N | 다름 | - | - |
| ~/dev/env-check | N | main | https://github.com/SkyWith628/env-check.git | 0 | 0 | ? | Y | 동일 | 2026-11-27 | - |
| ~/dev/persona-ize | N | main | https://github.com/SkyWith628/persona-ize.git | 0 | 0 | ? | Y | 다름 | 2026-11-25 | - |

## 4. 같은 GitHub 레포를 가리키는 폴더 (중복 후보)
- https://github.com/skywith628/oblige ×4
   - ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/_repos/oblige (브랜치 main, 미커밋 73)
   - ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/oblige (브랜치 main, 미커밋 152)
   - ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/oblige (브랜치 (detached), 미커밋 0)
   - ~/OneDrive - 인덕대학교/WorkSpace/claude/oblige (브랜치 (detached), 미커밋 0)
- https://github.com/skywith628/codesage ×4
   - ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/CodeSage (브랜치 deploy/oracle-cloud, 미커밋 5)
   - ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/_repos/codesage (브랜치 main, 미커밋 47)
   - ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/CodeSage (브랜치 (detached), 미커밋 60)
   - ~/OneDrive - 인덕대학교/WorkSpace/claude/CodeSage (브랜치 (detached), 미커밋 60)
- https://github.com/skywith628/carenote-ai ×2
   - ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/케어노트AI (브랜치 main, 미커밋 20)
   - ~/Library/Mobile Documents/com~apple~CloudDocs/WorkSpace_M/projects/carenote-ai (브랜치 v2, 미커밋 16)
- https://github.com/skywith628/jabis ×2
   - ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/_repos/jabis (브랜치 master, 미커밋 26)
   - ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/jabis (브랜치 master, 미커밋 1)
- https://github.com/skywith628/clausemate ×3
   - ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/ClauseMate (브랜치 main, 미커밋 2)
   - ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/ClauseMate (브랜치 main, 미커밋 0)
   - ~/OneDrive - 인덕대학교/WorkSpace/claude/ClauseMate (브랜치 main, 미커밋 0)
- https://github.com/skywith628/checkmate ×4
   - ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/_repos/checkmate (브랜치 master, 미커밋 118)
   - ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/checkmate (브랜치 test/git, 미커밋 1)
   - ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/checkmate (브랜치 (detached), 미커밋 0)
   - ~/OneDrive - 인덕대학교/WorkSpace/claude/checkmate (브랜치 (detached), 미커밋 0)
- https://github.com/skywith628/jikgugom ×4
   - ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/_repos/jikgugom (브랜치 main, 미커밋 0)
   - ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/sourcing-agent (브랜치 main, 미커밋 0)
   - ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/sourcing-agent (브랜치 main, 미커밋 0)
   - ~/OneDrive - 인덕대학교/WorkSpace/claude/sourcing-agent (브랜치 main, 미커밋 0)
- https://github.com/skywith628/toss-llm-trader ×3
   - ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/toss-llm-trader (브랜치 main, 미커밋 4)
   - ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/toss-llm-trader (브랜치 main, 미커밋 0)
   - ~/OneDrive - 인덕대학교/WorkSpace/claude/toss-llm-trader (브랜치 main, 미커밋 0)
- https://github.com/skywith628/skywith628 ×2
   - ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/SkyWith628 (브랜치 main, 미커밋 0)
   - ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/_repos/SkyWith628 (브랜치 main, 미커밋 0)
- https://github.com/skywith628/todo-list ×2
   - ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/_repos/todo-list (브랜치 main, 미커밋 29)
   - ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/todo-list (브랜치 main, 미커밋 28)

## 5. 레포 옆에 있는 git 아닌 폴더 (버전 관리 밖 후보)

### ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace
- Codex — 파일 1개 (git 아님)
- claude — 파일 14115개 (git 아님)

### ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude
- KU_8 — 파일 196개 (git 아님)
- _repos — 파일 501개 (git 아님)
- blog — 파일 2개 (git 아님)
- cosmetic-agent — 파일 3245개 (git 아님)
- social-previews — 파일 8개 (git 아님)

### ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/_repos

### ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude
- EvoWork — 파일 0개 (git 아님)
- KU_8 — 파일 51개 (git 아님)
- _repos — 파일 150개 (git 아님)
- blog — 파일 2개 (git 아님)
- cosmetic-agent — 파일 58개 (git 아님)
- social-previews — 파일 8개 (git 아님)

### ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/_repos

### ~/Library/Mobile Documents/com~apple~CloudDocs/WorkSpace_M
- projects — 파일 3632개 (git 아님)
- shared — 파일 0개 (git 아님)

### ~/Library/Mobile Documents/com~apple~CloudDocs/WorkSpace_M/_global/codex/.tmp

### ~/Library/Mobile Documents/com~apple~CloudDocs/WorkSpace_M/projects
- ccanvas — 파일 0개 (git 아님)
- mini — 파일 165개 (git 아님)
- persona-ize — 파일 590개 (git 아님)
- toss-autotrader — 파일 82개 (git 아님)

## 6. 클라우드 폴더 안의 위험 요소
### 6-1. 의존성 폴더 (node_modules / .venv / venv / .next) — 기기마다 달라 동기화하면 안 되는 것
- 개수 53개, 합계 약 7200 MB (내려받지 않은 파일은 0으로 집계돼 실제보다 작게 보일 수 있음)
  - 1310 MB  ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/checkmate/web/.next
  - 1085 MB  ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/KU_8/.venv
  - 945 MB  ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/checkmate/web/node_modules
  - 824 MB  ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/oblige/web/.next
  - 559 MB  ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/oblige/web/node_modules
  - 391 MB  ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/ClauseMate/frontend/node_modules

### 6-2. 클라우드 안의 .claude 폴더 (설정/세션 폴더가 섞여 들어갔는지)
- ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/.claude — 🟡 기기 설정 폴더로 쓰인 흔적: sessions history.jsonl shell-snapshots plugins projects cache
- ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/CodeSage/.claude — 프로젝트 설정만 있음
- ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/_repos/jikgugom/.claude — 프로젝트 설정만 있음
- ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/_repos/oblige/.claude — 프로젝트 설정만 있음
- ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/cosmetic-agent/.claude — 프로젝트 설정만 있음
- ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/oblige/.claude — 프로젝트 설정만 있음
- ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/sourcing-agent/.claude — 프로젝트 설정만 있음
- ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/.claude — 🟡 기기 설정 폴더로 쓰인 흔적: sessions history.jsonl shell-snapshots session-env plugins projects cache
- ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/CodeSage/.claude — 프로젝트 설정만 있음
- ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/_repos/jikgugom/.claude — 프로젝트 설정만 있음
- ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/_repos/oblige/.claude — 프로젝트 설정만 있음
- ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/cosmetic-agent/.claude — 프로젝트 설정만 있음
- ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/oblige/.claude — 프로젝트 설정만 있음
- ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/sourcing-agent/.claude — 프로젝트 설정만 있음
- ~/Library/Mobile Documents/com~apple~CloudDocs/WorkSpace_M/.claude — 프로젝트 설정만 있음
- ~/Library/Mobile Documents/com~apple~CloudDocs/WorkSpace_M/projects/persona-ize/repo/.claude — 프로젝트 설정만 있음
- ~/OneDrive - 인덕대학교/WorkSpace/claude/.claude — 🟡 기기 설정 폴더로 쓰인 흔적: sessions history.jsonl shell-snapshots session-env plugins projects cache
- ~/OneDrive - 인덕대학교/WorkSpace/claude/CodeSage/.claude — 프로젝트 설정만 있음
- ~/OneDrive - 인덕대학교/WorkSpace/claude/_repos/jikgugom/.claude — 프로젝트 설정만 있음
- ~/OneDrive - 인덕대학교/WorkSpace/claude/_repos/oblige/.claude — 프로젝트 설정만 있음
- ~/OneDrive - 인덕대학교/WorkSpace/claude/cosmetic-agent/.claude — 프로젝트 설정만 있음
- ~/OneDrive - 인덕대학교/WorkSpace/claude/oblige/.claude — 프로젝트 설정만 있음
- ~/OneDrive - 인덕대학교/WorkSpace/claude/sourcing-agent/.claude — 프로젝트 설정만 있음

### 6-3. 동기화 충돌본으로 의심되는 파일 (이름 패턴 기준, 정상 파일이 섞일 수 있음)
- ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/1학년 1학기/HTML강의자료/제25강 폼(FORM)양식 태그(1) (1).PPT
- ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/1학년 1학기/HTML강의자료/제26강 폼(FORM)양식 태그(2) (1).PPT
- ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/1학년 1학기/HTML강의자료/제27강 폼(FORM)양식 태그(3) (1).ppt
- ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/1학년 2학기/게임프로그래밍/ArrayLHR/Assets/New Material 2.mat
- ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/1학년 2학기/게임프로그래밍/ArrayLHR/Assets/New Material 2.mat.meta
- ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/1학년 2학기/게임프로그래밍/GameManagerLHR/Assets/New Material 2.mat
- ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/1학년 2학기/게임프로그래밍/GameManagerLHR/Assets/New Material 2.mat.meta
- ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/1학년 2학기/게임프로그래밍/ParentChild_LHR/Assets/New Material 2.mat
- ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/1학년 2학기/게임프로그래밍/ParentChild_LHR/Assets/New Material 2.mat.meta
- ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/1학년 2학기/클라우드기초/과제 2.zip
- ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/2026학년도 총학/38대 기획부장/2026 연지축제/02_예산/2026학년도 인덕대학교 '연지' 대동제  학생회비 소요예산 산출내역서 - 탑플랜(2026.08.24) (2).pdf
- ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/2026학년도 총학/38대 기획부장/2026 연지축제/03_무대·공연/큐시트/2026학년도 인덕대학교 연지축제 1일차 큐시트 초안-탑플랜(2026.08.24.) (1) (1).xlsx
- ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/2026학년도 총학/38대 기획부장/2026 연지축제/03_무대·공연/큐시트/2026학년도 인덕대학교 연지축제 1일차 큐시트 초안-탑플랜(2026.08.24.) (1).xlsx
- ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/2026학년도 총학/38대 기획부장/2026 연지축제/03_무대·공연/큐시트/2026학년도 인덕대학교 연지축제 2일차 큐시트 초안-탑플랜(2026.08.24) (1).xlsx
- ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/2026학년도 총학/38대 기획부장/2026 연지축제/03_무대·공연/큐시트/2026학년도 인덕대학교 연지축제 3일차 큐시트 초안-탑플랜(2026.08.24) (1).xlsx
- ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/2026학년도 총학/38대 기획부장/2026 연지축제/04_주점·부스/홍보부스 운영/2026 연지축제_홍보부스_운영현황_수정본 (2).xlsx
- ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/2026학년도 총학/38대 기획부장/2026 연지축제/05_홍보·디자인/인스타그램 홍보물/인스타 피드_푸드트럭 안내 2.jpg
- ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/2026학년도 총학/38대 기획부장/2026_1학기/5월 랜덤박스 행사/회의록 2.hwpx
- ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/KU_8/보관/중복파일/Naive Bayes (1).pdf
- ~/Library/CloudStorage/OneDrive-인덕대학교/1학년 2학기/클라우드기초/과제 2.zip
- ~/Library/CloudStorage/OneDrive-인덕대학교/2026학년도 총학/38대 기획부장/2026_1학기/5월 랜덤박스 행사/회의록 2.hwpx
- ~/Library/CloudStorage/OneDrive-인덕대학교/3학년 1학기/빅데이터/-skywith의 MacBook Pro.RData
- ~/Library/CloudStorage/OneDrive-인덕대학교/3학년 1학기/빅데이터/-skywith의 MacBook Pro.Rhistory
- ~/Library/CloudStorage/OneDrive-인덕대학교/3학년 1학기/빅데이터/chick (1).csv
- ~/Library/CloudStorage/OneDrive-인덕대학교/3학년 1학기/정보보안/5주차 네트워크 보안 2.pdf
- ~/Library/CloudStorage/OneDrive-인덕대학교/3학년 1학기/정보보안/실습-skywith의 MacBook Pro.py
- ~/Library/CloudStorage/OneDrive-인덕대학교/3학년 1학기/정보보안/정보보안 중간고사 예상문제 2.docx
- ~/Library/Mobile Documents/com~apple~CloudDocs/WorkSpace_M/projects/carenote-ai/src/carenote/orchestration/graph 2.py
- ~/Library/Mobile Documents/com~apple~CloudDocs/WorkSpace_M/projects/persona-ize/docs/페르소나 키보드 앱 와이어프레임 (1).pdf
- ~/Library/Mobile Documents/com~apple~CloudDocs/skywith/학교·행사/2026 축제/인스타그램 홍보물/인스타 피드_푸드트럭 안내 2.jpg
- … 외 8개

### 6-4. 비밀정보로 보이는 파일 위치 (내용은 읽지 않음, 이름만)
- 로컬: ~/.claude.json
- 로컬: ~/.codex/auth.json
- 로컬: ~/.ssh/persona-ize-ec2.pem
- 로컬: ~/Documents/Codex/2026-08-24/new-chat/seoul-air-station-analysis/.env
- 🔴 클라우드 안: ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/ClauseMate/frontend/.env.local
- 🔴 클라우드 안: ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/CodeSage/.env
- 🔴 클라우드 안: ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/CodeSage/codesage-skywith.2026-06-17.private-key.pem
- 🔴 클라우드 안: ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/checkmate/web/.env.local
- 🔴 클라우드 안: ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/cosmetic-agent/.env
- 🔴 클라우드 안: ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/jabis/.env
- 🔴 클라우드 안: ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/jabis/backend/.env
- 🔴 클라우드 안: ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/oblige/ai/.env
- 🔴 클라우드 안: ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/oblige/api/.env
- 🔴 클라우드 안: ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/sourcing-agent/.env
- 🔴 클라우드 안: ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/sourcing-agent/dashboard/.env.local
- 🔴 클라우드 안: ~/Library/CloudStorage/OneDrive-인덕대학교 (2026. 10. 22. 오전 9:30)/WorkSpace/claude/toss-llm-trader/.env
- 🔴 클라우드 안: ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/ClauseMate/frontend/.env.local
- 🔴 클라우드 안: ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/CodeSage/.env
- 🔴 클라우드 안: ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/CodeSage/codesage-skywith.2026-06-17.private-key.pem
- 🔴 클라우드 안: ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/checkmate/web/.env.local
- 🔴 클라우드 안: ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/cosmetic-agent/.env
- 🔴 클라우드 안: ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/jabis/.env
- 🔴 클라우드 안: ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/jabis/backend/.env
- 🔴 클라우드 안: ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/oblige/ai/.env
- 🔴 클라우드 안: ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/oblige/api/.env
- 🔴 클라우드 안: ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/sourcing-agent/.env
- 🔴 클라우드 안: ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/sourcing-agent/dashboard/.env.local
- 🔴 클라우드 안: ~/Library/CloudStorage/OneDrive-인덕대학교/WorkSpace/claude/toss-llm-trader/.env
- 🔴 클라우드 안: ~/Library/Mobile Documents/com~apple~CloudDocs/WorkSpace_M/_global/claude/.claude.json
- 🔴 클라우드 안: ~/Library/Mobile Documents/com~apple~CloudDocs/WorkSpace_M/_global/codex/auth.json
- 🔴 클라우드 안: ~/Library/Mobile Documents/com~apple~CloudDocs/WorkSpace_M/projects/carenote-ai/.env
- 🔴 클라우드 안: ~/Library/Mobile Documents/com~apple~CloudDocs/WorkSpace_M/projects/mini/competitor-monitoring-agent/.env
- 🔴 클라우드 안: ~/Library/Mobile Documents/com~apple~CloudDocs/WorkSpace_M/projects/toss-autotrader/.env
- 🔴 클라우드 안: ~/Library/Mobile Documents/com~apple~CloudDocs/WorkSpace_M/projects/url-shortener/.env
- 🔴 클라우드 안: ~/OneDrive - 인덕대학교/WorkSpace/claude/ClauseMate/frontend/.env.local
- 🔴 클라우드 안: ~/OneDrive - 인덕대학교/WorkSpace/claude/CodeSage/.env
- 🔴 클라우드 안: ~/OneDrive - 인덕대학교/WorkSpace/claude/CodeSage/codesage-skywith.2026-06-17.private-key.pem
- 🔴 클라우드 안: ~/OneDrive - 인덕대학교/WorkSpace/claude/checkmate/web/.env.local
- 🔴 클라우드 안: ~/OneDrive - 인덕대학교/WorkSpace/claude/cosmetic-agent/.env
- 🔴 클라우드 안: ~/OneDrive - 인덕대학교/WorkSpace/claude/jabis/.env

## 7. AI 환경 (Claude Code / Codex)
- claude: /Users/sktwith/.local/bin/claude 2.1.307 (Claude Code)
- 환경변수: CLAUDE_CONFIG_DIR=(없음) / CODEX_HOME=(없음) / WORK_ROOT=(없음)
- ~/.claude/CLAUDE.md: 있음 (57줄, md5 13c113787bd973152090f160e3dd75c1, 첫 줄: # AGENTS.md — 전역 규칙 (Claude / Codex 공용 원본))
- ~/.claude/settings.json (token/secret/key/password 포함 줄은 제외하고 표시):
```json
{
  "effortLevel": "high",
  "theme": "dark",
  "inputNeededNotifEnabled": true,
  "agentPushNotifEnabled": true,
  "enableWorkflows": true,
  "skipWorkflowUsageWarning": true
}
```
- 설치된 플러그인:
```
```
- 등록된 마켓플레이스:
```
```
- ~/.claude/skills: ai-ml blog court deploy dgaja llm-agent portfolio project-init shimai study work 
- Claude로 작업했던 폴더(~/.claude/projects, 이 기기 기준 68개 레포와 비교용):
  - -Users-sktwith
  - -Users-sktwith-Library-CloudStorage-OneDrive---------------WorkSpace-claude
  - -Users-sktwith-Library-CloudStorage-OneDrive---------------WorkSpace-claude-EvoWork
  - -Users-sktwith-Library-CloudStorage-OneDrive---------------WorkSpace-claude-KU-8
  - -Users-sktwith-Library-CloudStorage-OneDrive---------------WorkSpace-claude-sourcing-agent
  - -Users-sktwith-Library-CloudStorage-OneDrive-------3---1---JAVA-------
  - -Users-sktwith-Library-CloudStorage-OneDrive-------WorkSpace-----AI
  - -Users-sktwith-Library-CloudStorage-OneDrive-------WorkSpace-claude
  - -Users-sktwith-Library-CloudStorage-OneDrive-------WorkSpace-claude-ClauseMate
  - -Users-sktwith-Library-CloudStorage-OneDrive-------WorkSpace-claude-CodeSage
  - -Users-sktwith-Library-CloudStorage-OneDrive-------WorkSpace-claude-EvoWork
  - -Users-sktwith-Library-CloudStorage-OneDrive-------WorkSpace-claude-KU-8
  - -Users-sktwith-Library-CloudStorage-OneDrive-------WorkSpace-claude-checkmate
  - -Users-sktwith-Library-CloudStorage-OneDrive-------WorkSpace-claude-sourcing-agent
  - -Users-sktwith-Library-CloudStorage-OneDrive-------WorkSpace-claude-toss-llm-trader
  - -Users-sktwith-Library-Mobile-Documents-com-apple-CloudDocs-WorkSpace-M
  - -Users-sktwith-dev-oblige
  - -Volumes-WorkSpace-M
- 메모리 파일 수: 29개
- ~/.codex: 있음 (AGENTS.md md5: 6a6d7d37ae84840d18c53bcbb675b6ab)

## 8. USB · 구 환경 흔적
- /Volumes: Macintosh HD,Recovery,com.apple.TimeMachine.localsnapshots
- 🟡 구 환경 파일/폴더: ~/Library/Mobile Documents/com~apple~CloudDocs/WorkSpace_M
- 🟡 구 환경 파일/폴더: ~/Library/Mobile Documents/com~apple~CloudDocs/WorkSpace_M/_global
- 🟡 구 환경 파일/폴더: ~/Library/Mobile Documents/com~apple~CloudDocs/WorkSpace_M/_global/bootstrap.sh
- 🟡 구 환경 파일/폴더: ~/Library/Mobile Documents/com~apple~CloudDocs/WorkSpace_M/_global/env.sh
