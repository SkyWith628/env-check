# 노트북 플러그인 설치 보고 — 2026-11-27

> [플러그인-설치-지침.md](../플러그인-설치-지침.md) 노트북 칸 기준. CLI가 없어 **3번 "CLI가 없는 기기"(settings.json 직접 편집)** 방식으로 했습니다.

## 1. 사전 확인
| 항목 | 결과 |
|---|---|
| Node | **설치함**: 처음에는 없어서 `winget install OpenJS.NodeJS.LTS`로 설치 → `v26.13.1` (`C:\Program Files\nodejs`, 설치 파일 해시 확인됨) |
| gh | 없음. 대신 git 자격 증명(GCM)으로 비공개 `skywith-marketplace`에 접근되는 것을 확인(`ls-remote` HEAD `d8ce19b45b28`) |
| claude CLI | 없음 (Claude 데스크탑 앱만 사용) |
| `~/.claude/CLAUDE.md` | 없음 |
| `~/.claude/skills` | 없음 |
| `~/.claude/settings.json` | 있음. 마켓플레이스 `everything-claude-code`(외부 git) 1개 등록, `enabledPlugins` 비어 있음 |
| 등록된 마켓플레이스(`known_marketplaces.json`) | `everything-claude-code`만. `skywith-local` 없음 |

## 2. 이중 로드 원인 제거
옮긴 것 **없음**. 옛 전역 규칙 사본, 이름이 겹치는 스킬, `skywith-local`(Folder) 등록이 모두 없었습니다.

## 3. 설치
- `~/.claude/settings.json` → `~/.claude/settings.json.bak-20261127`로 백업한 뒤, 기존 키를 보존하고 아래만 합쳤습니다(JSON 문법 검사 통과).
  - `extraKnownMarketplaces.skywith-local` = `{ source: github SkyWith628/skywith-marketplace, autoUpdate: true }`
  - `enabledPlugins["skywith@skywith-local"] = true`
  - `env.HANDOFF_DIR` = `C:\Users\LEE HA RANG\iCloudDrive\_handoff`
- iCloud for Windows 폴더 `C:\Users\LEE HA RANG\iCloudDrive`가 있어 그 아래 **`_handoff`만 새로 만들었습니다**(빈 폴더, `WorkSpace_M` 밖).
- `everything-claude-code` 등록은 결정 전이라 그대로 두었습니다.
- 플러그인 Version(커밋 해시 12자리): **확인 못 함**. CLI가 없어 `claude plugin list`를 쓸 수 없고, 앱이 설치한 위치도 `~/.claude/plugins`(skywith 항목 없음)·`AppData`에서 찾지 못했습니다. 앱이 다른 곳에 캐시하는 것으로 보입니다.

## 4. 검증
| 항목 | 결과 |
|---|---|
| 새 세션(규칙 파일 없는 폴더)에서 전역 규칙 버전 질문 | **`v4.1` — 성공** (사용자가 새 세션에서 확인) |
| 이중 주입 | 해당 없음(2번에서 옮길 것이 없었음). 이중으로 보인다는 보고 없음 |
| `HANDOFF_DIR` | 이 세션에서 `C:\Users\LEE HA RANG\iCloudDrive\_handoff`로 나옴 |

## 5. 막힌 점 · 물을 것
1. **플러그인 버전 해시 미확인**: CLI가 없는 기기에서 버전을 볼 방법이 있으면 알려 주세요(앱 `/plugin` 화면 등). 지금은 규칙 주입(v4.1) 성공으로 설치를 판단했습니다.
2. **`everything-claude-code` 마켓플레이스**: 유지·삭제 결정 필요(플러그인은 설치돼 있지 않음).
3. Claude CLI 설치 여부는 여전히 보류(Node가 생겼으므로 원하면 설치 가능).
