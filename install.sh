#!/usr/bin/env bash
# 사용: git clone https://github.com/seongwon030/agent-skills /tmp/agent-skills && bash /tmp/agent-skills/install.sh
# 현재 디렉터리를 작업 루트로 본다.
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
DEST="${CODEX_HOME:-$HOME/.codex}/skills"

mkdir -p "$DEST"
for s in "$HERE"/skills/*/; do
  name="$(basename "$s")"
  rm -rf "$DEST/$name"
  cp -R "$s" "$DEST/$name"
done

if [ -f AGENTS.md ]; then
  echo "AGENTS.md 이미 있음 — 건드리지 않음. \$kickoff 가 기존 내용 아래에 절을 추가한다."
else
  cp "$HERE/AGENTS.template.md" AGENTS.md
  echo "AGENTS.md 생성: $(pwd)/AGENTS.md"
fi

echo "설치됨 ($DEST): $(ls "$HERE/skills" | tr '\n' ' ')"
echo "다음: codex 를 (재)실행한 뒤 \$kickoff"
