#!/usr/bin/env bash
# 사용: 과제 레포 루트에서
#   git clone https://github.com/seongwon030/agent-skills /tmp/agent-skills && bash /tmp/agent-skills/install.sh
[ -n "${BASH_VERSION:-}" ] || exec bash "$0" "$@"
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
DEST="${CODEX_HOME:-${HOME:?HOME 없음. CODEX_HOME 지정}/.codex}/skills"
ROOT="$(git rev-parse --show-toplevel 2>/dev/null)" || { echo "과제 레포 루트(git 저장소 안)에서 실행하세요."; exit 1; }
[ "$ROOT" != "$HERE" ] || { echo "agent-skills 레포 안이 아니라 과제 레포에서 실행하세요."; exit 1; }

mkdir -p "$DEST"
for s in "$HERE"/skills/*/; do
  name="$(basename "$s")"
  rm -rf "$DEST/$name"
  cp -R "${s%/}" "$DEST/"
done

if [ -f "$ROOT/AGENTS.md" ]; then
  echo "AGENTS.md 이미 있음 — 건드리지 않음. \$kickoff 가 기존 내용 아래에 절을 추가한다."
else
  cp "$HERE/AGENTS.template.md" "$ROOT/AGENTS.md"
  echo "AGENTS.md 생성: $ROOT/AGENTS.md"
fi

echo "설치됨 ($DEST): $(ls "$HERE/skills" | tr '\n' ' ')"
echo "다음: codex 를 (재)실행한 뒤 \$kickoff. 목록에 안 뜨면 codex --version 확인 후 SKILL.md 본문을 AGENTS.md에 붙이는 폴백."
echo "당일 순서: cat $HERE/README.md"
