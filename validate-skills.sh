#!/usr/bin/env bash

set -euo pipefail

SKILLS_DIR="skills"
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AGENTSKILLS_ROOT="/tmp/agentskills"
SKILLS_REF_DIR="$AGENTSKILLS_ROOT/skills-ref"
VENV_DIR="$SKILLS_REF_DIR/.venv"

echo "Validating skills with official skills-ref library"
echo "================================================"
echo

if [ ! -d "$SKILLS_DIR" ]; then
  echo "Error: '$SKILLS_DIR' directory not found in $REPO_ROOT"
  exit 1
fi

if [ ! -d "$SKILLS_REF_DIR" ]; then
  echo "Cloning agentskills reference repository..."
  rm -rf "$AGENTSKILLS_ROOT"
  git clone https://github.com/agentskills/agentskills.git "$AGENTSKILLS_ROOT"
fi

cd "$SKILLS_REF_DIR"

if [ ! -d "$VENV_DIR" ]; then
  echo "Installing skills-ref environment..."
  if command -v uv >/dev/null 2>&1; then
    uv sync
  else
    python3 -m venv .venv
    # shellcheck disable=SC1091
    source .venv/bin/activate
    pip install --upgrade pip
    pip install -e .
  fi
fi

# shellcheck disable=SC1091
source "$VENV_DIR/bin/activate"

cd "$REPO_ROOT"

PASSED=0
FAILED=0
FAILED_SKILLS=()

echo "Running validation..."
echo

shopt -s nullglob
for skill_dir in "$SKILLS_DIR"/*/; do
  skill_name="$(basename "$skill_dir")"
  printf "%-35s" "$skill_name"

  output="$(skills-ref validate "$skill_dir" 2>&1 || true)"

  if echo "$output" | grep -qi "Valid skill"; then
    echo "PASS"
    PASSED=$((PASSED + 1))
  else
    echo "FAIL"
    FAILED=$((FAILED + 1))
    FAILED_SKILLS+=("$skill_name")
    echo "$output" | sed 's/^/  /'
  fi
done

echo
echo "================================================"
echo "Summary"
echo "Passed: $PASSED"
echo "Failed: $FAILED"
echo

if [ "$FAILED" -eq 0 ]; then
  echo "All skills are valid."
  exit 0
fi

echo "Failed skills:"
for skill in "${FAILED_SKILLS[@]}"; do
  echo " - $skill"
done

exit 1