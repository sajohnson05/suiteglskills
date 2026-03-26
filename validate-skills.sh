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

echo "Running skill validation..."
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
echo "Running repository governance checks..."
echo "================================================"

WARNINGS=0

check_exists() {
  local path="$1"
  local label="$2"

  if [ -e "$path" ]; then
    printf "%-55s %s\n" "$label" "PASS"
  else
    printf "%-55s %s\n" "$label" "WARN"
    WARNINGS=$((WARNINGS + 1))
  fi
}

check_contains() {
  local file="$1"
  local pattern="$2"
  local label="$3"

  if [ -f "$file" ] && grep -qi "$pattern" "$file"; then
    printf "%-55s %s\n" "$label" "PASS"
  else
    printf "%-55s %s\n" "$label" "WARN"
    WARNINGS=$((WARNINGS + 1))
  fi
}

check_exists "CLAUDE.md" "CLAUDE.md exists"
check_exists "README.md" "README.md exists"
check_exists "context/context_loading_order.md" "context loading order file exists"
check_exists "context/odbc_powerbi_rules.md" "ODBC / Power BI rules file exists"
check_exists "context/mcp_validation_rules.md" "MCP validation rules file exists"
check_exists "context/customizations.md" "customizations file exists"
check_exists "skills/suiteql-finance-reporting/SKILL.md" "finance reporting skill exists"
check_exists "skills/suiteql-reconciler/SKILL.md" "reconciler skill exists"
check_exists "flows/query_build_workflow.md" "query build workflow exists"
check_exists "flows/reconciler_workflow.md" "reconciler workflow exists"

check_contains "CLAUDE.md" "Model Routing Policy" "CLAUDE.md includes model routing policy"
check_contains "CLAUDE.md" "suiteql-finance-reporting" "CLAUDE.md references finance reporting skill"
check_contains "CLAUDE.md" "customizations.md" "CLAUDE.md references customizations governance"
check_contains "README.md" "Model Selection Guidance" "README.md includes model selection guidance"
check_contains "README.md" "suiteql-finance-reporting" "README.md references finance reporting skill"
check_contains "README.md" "suiteql-reconciler" "README.md references reconciler skill"

echo
echo "================================================"
echo "Summary"
echo "Skill validation passed: $PASSED"
echo "Skill validation failed: $FAILED"
echo "Governance warnings: $WARNINGS"
echo

if [ "$FAILED" -eq 0 ]; then
  echo "All skills are structurally valid."
else
  echo "Some skills failed validation."
fi

if [ "$WARNINGS" -gt 0 ]; then
  echo "There are governance warnings to review."
fi

echo
if [ "$FAILED" -eq 0 ]; then
  exit 0
else
  echo "Failed skills:"
  for skill in "${FAILED_SKILLS[@]}"; do
    echo " - $skill"
  done
  exit 1
fi