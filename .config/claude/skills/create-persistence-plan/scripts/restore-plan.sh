#!/usr/bin/env bash
# Restore a saved plan file by stripping frontmatter and copying to .claude/plans/.
#
# Usage: restore-plan.sh <saved_file> <project_dir>
#
# Arguments:
#   saved_file   - Path to the saved plan file (with frontmatter)
#   project_dir  - Root directory of the project (where .claude/plans/ lives)
#
# Output: Prints the restored file path on success.

set -euo pipefail

die() { echo "ERROR: $1" >&2; exit 1; }

[[ $# -ge 2 ]] || die "Usage: restore-plan.sh <saved_file> <project_dir>"

SAVED_FILE="$1"
PROJECT_DIR="$2"

[[ -f "$SAVED_FILE" ]] || die "Saved file not found: $SAVED_FILE"
[[ -d "$PROJECT_DIR" ]] || die "Project directory not found: $PROJECT_DIR"

# Extract original_file from frontmatter
ORIGINAL_FILE="$(awk '
  BEGIN { in_fm=0 }
  NR==1 && /^---$/ { in_fm=1; next }
  in_fm && /^---$/ { exit }
  in_fm && /^original_file:/ {
    gsub(/^original_file:[[:space:]]*"?/, "")
    gsub(/"$/, "")
    print
    exit
  }
' "$SAVED_FILE")"

# Determine destination path
PLANS_DIR="${PROJECT_DIR}/.claude/plans"
mkdir -p "$PLANS_DIR"

if [[ -n "$ORIGINAL_FILE" ]]; then
  DEST_BASENAME="$(basename "$ORIGINAL_FILE")"
else
  # Fallback: use saved filename
  DEST_BASENAME="$(basename "$SAVED_FILE")"
fi

DEST_PATH="${PLANS_DIR}/${DEST_BASENAME}"

# Strip frontmatter and copy
awk '
  BEGIN { in_fm=0; after_fm=0 }
  NR==1 && /^---$/ { in_fm=1; next }
  in_fm && /^---$/ { in_fm=0; after_fm=1; next }
  in_fm { next }
  after_fm && NR>0 && /^$/ && !printed { next }
  { printed=1; print }
' "$SAVED_FILE" > "$DEST_PATH"

echo "$DEST_PATH"
