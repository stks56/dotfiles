#!/usr/bin/env bash
# Save a Claude Code plan file with YAML frontmatter metadata.
#
# Usage: save-plan.sh <source_file> <plan_dir> <title> <project_path> [status]
#
# Arguments:
#   source_file   - Path to the original plan file (e.g. .claude/plans/xxx.md)
#   plan_dir      - Directory to save the plan to (resolved from $CLAUDE_CODE_PLAN_DIR)
#   title         - Plan title (extracted from H1 heading)
#   project_path  - Absolute path of the project
#   status        - Plan status: in_progress (default), completed, archived
#
# Output: Prints the saved file path on success.

set -euo pipefail

die() { echo "ERROR: $1" >&2; exit 1; }

# --- Validate arguments ---
[[ $# -ge 4 ]] || die "Usage: save-plan.sh <source_file> <plan_dir> <title> <project_path> [status]"

SOURCE_FILE="$1"
PLAN_DIR="$2"
TITLE="$3"
PROJECT_PATH="$4"
STATUS="${5:-in_progress}"

[[ -f "$SOURCE_FILE" ]] || die "Source file not found: $SOURCE_FILE"
[[ "$STATUS" =~ ^(in_progress|completed|archived)$ ]] || die "Invalid status: $STATUS (must be in_progress, completed, or archived)"

# --- Ensure destination directory exists ---
mkdir -p "$PLAN_DIR"

# --- Generate filename: YYYY-MM-DD:HH-タスク名.md ---
DATE_PREFIX="$(date +%Y-%m-%d:%H)"
FILENAME="${DATE_PREFIX}-${TITLE}.md"

# --- Handle duplicate filenames ---
DEST_PATH="${PLAN_DIR}/${FILENAME}"
if [[ -f "$DEST_PATH" ]]; then
  COUNTER=2
  while true; do
    BASE="${FILENAME%.md}"
    CANDIDATE="${BASE}_${COUNTER}.md"
    DEST_PATH="${PLAN_DIR}/${CANDIDATE}"
    [[ -f "$DEST_PATH" ]] || break
    ((COUNTER++))
  done
fi

# --- Generate timestamps ---
CREATED_AT="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
SAVED_AT="$CREATED_AT"

# --- Build frontmatter and write file ---
{
  echo "---"
  echo "title: \"${TITLE}\""
  echo "original_file: \"${SOURCE_FILE}\""
  echo "project: \"${PROJECT_PATH}\""
  echo "status: ${STATUS}"
  echo "created_at: ${CREATED_AT}"
  echo "saved_at: ${SAVED_AT}"
  echo "---"
  echo ""
  cat "$SOURCE_FILE"
} > "$DEST_PATH"

echo "$DEST_PATH"
