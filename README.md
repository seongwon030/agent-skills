# agent-skills

Codex 작업 루틴을 스킬 3개로 고정한 것. 코드보다 "AI와 어떻게 일했는가"가 로그·커밋·문서에 남게 한다.

## 설치 (한 줄)

```bash
git clone https://github.com/seongwon030/agent-skills /tmp/agent-skills && bash /tmp/agent-skills/install.sh
```

`~/.codex/skills/`에 복사하고, 작업 루트에 `AGENTS.md`가 없으면 템플릿을 만든다. `codex`를 다시 띄우면 `$kickoff`가 보인다.

## 루틴

| 때 | 스킬 | 산출물 |
|---|---|---|
| 시작 | `$kickoff` | `AGENTS.md` — 목표·제약·작업분해·검증. 계획·가정만, 코드 없음 |
| 단계마다 | `$log` | `NOTES.md` append — 결정·바꾼 것·깨지는 입력 3가지·실행한 검증 + 작은 커밋 |
| 맥락 길어지면 | `$log sum` | `NOTES.md` 현재 상태 갱신 |
| 끝 20분 전 | `$wrap` | 제출 체크(실행해서) + `RECALL.md`(약점 → 파급 → 다음 검증) |

## 원칙

- 근거 없는 문서는 쓰지 않는다. 검증 줄에는 실행한 명령과 결과만 적는다.
- 요구사항 단위로 작게 커밋한다. 메시지는 `<무엇> / 검증: <어떻게>`.
- 계획은 한 번 근거를 들어 고친 뒤 실행한다.
