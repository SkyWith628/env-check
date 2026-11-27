# 맥북 플러그인 설치 보고 — 2026-11-27

> 근거: [플러그인-설치-지침.md](../플러그인-설치-지침.md) 맥북 칸.

## 1. 사전 확인
| 항목 | 결과 |
|---|---|
| Node | v26.12.1 |
| gh | 로그인됨 (SkyWith628, scopes: gist, read:org, repo) |
| Claude CLI | 2.1.307 (`~/.local/bin/claude`) |
| `~/.claude/CLAUDE.md` | 있었음 — 첫 줄 `# AGENTS.md — 전역 규칙 (Claude / Codex 공용 원본)`, v4.0, md5 `13c113787bd973152090f160e3dd75c1` |
| `~/.claude/skills` | ai-ml, blog, court, deploy, dgaja, llm-agent, portfolio, project-init, shimai, study, work |
| 마켓플레이스 | `anthropic-plugin-directory`(내장), `claude-plugins-official`. **`skywith-local` 없음**(2-3단계 해당 없음) |
| 설치된 플러그인 | 없음 |

## 2. 이중 로드 원인 제거 (삭제 없이 이동)
| 원위치 | 백업 위치 |
|---|---|
| `~/.claude/CLAUDE.md` (전역 규칙 v4.0) | `~/.claude/CLAUDE.md.bak-20261127` |
| `~/.claude/skills/{ai-ml,blog,deploy,dgaja,llm-agent,portfolio,project-init,shimai,study,work}` (10개) | `~/.claude/skills-backup/` |
| `~/.claude/settings.json` | `~/.claude/settings.json.bak-20261127` (설치 전 원본 6개 키) |

- `court`는 그대로 `~/.claude/skills/court`에 둠. `agent-dashboard`는 원래 없었음.

## 3. 설치
- `claude plugin marketplace add SkyWith628/skywith-marketplace` → 성공 (`skywith-local`)
- `claude plugin install skywith@skywith-local --scope user` → 성공
- `claude plugin list`: **skywith@skywith-local, Version `d8ce19b45b28`**(12자리), Scope user, enabled
- `settings.json` 병합: 기존 키 유지 + `extraKnownMarketplaces.skywith-local`(github, `autoUpdate: true`), `enabledPlugins`, `env.HANDOFF_DIR` = `/Users/sktwith/Library/Mobile Documents/com~apple~CloudDocs/_handoff`. JSON 유효성 확인.
- iCloud 루트에 `_handoff/` 폴더 새로 만듦(비어 있음).
- 설치 전 확인: 훅 `hooks/print-rules.js`는 플러그인 안 `rules/AGENTS.md`만 읽어 `additionalContext`로 출력(네트워크·쓰기 없음).

## 4. 검증
| 항목 | 결과 |
|---|---|
| 설치된 훅 직접 실행 (`~/.claude/plugins/cache/skywith-local/skywith/d8ce19b45b28/hooks/print-rules.js`) | ✅ `SessionStart` 출력, 1,236자, 첫 줄 `# 전역 규칙 v4.1` |
| 플러그인 스킬 | ✅ agent-dashboard, ai-ml, blog, deploy, dgaja, llm-agent, portfolio, project-init, shimai, study, work (11개) |
| 이중 주입 원인 | ✅ `~/.claude/CLAUDE.md` 없음, 겹치는 로컬 스킬 0 |
| `claude -p`로 새 세션 검증 (빈 폴더) | ✅ `v4.1` (처음엔 CLI 인증 만료로 실패 → 사용자 `/login` 후 재실행) |
| 이중 주입 | ✅ "1벌, v4.1 (SessionStart 훅으로 들어온 것 한 번뿐)" |
| 스킬 | ✅ `skywith:` 11개 + 로컬 `court`, 이름 겹침 없음 |
| `HANDOFF_DIR` | ✅ 새 세션에서 `/Users/sktwith/Library/Mobile Documents/com~apple~CloudDocs/_handoff` |

## 5. 막힌 점 / 사용자에게 물을 것
- 없음. CLI 재로그인 후 4번 검증 전부 통과.
- 설치를 진행한 앱 세션은 옛 규칙(v4.0)을 이미 불러온 상태였으므로, 앱에서도 새 세션부터 v4.1이 적용됨.
- 옛 사본(`~/.claude/CLAUDE.md.bak-20261127`, `~/.claude/skills-backup/`)은 그대로 보관 중. 문제없으면 나중에 정리.
