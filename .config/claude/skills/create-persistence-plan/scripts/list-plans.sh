#!/usr/bin/env bash
# List saved Claude Code plan files with metadata.
#
# Usage: list-plans.sh <plan_dir> [status_filter] [project_filter]
#
# Arguments:
#   plan_dir        - Directory containing saved plan files
#   status_filter   - Optional: filter by status (in_progress, completed, archived)
#   project_filter  - Optional: filter by project path (substring match)
#
# Output: TSV with columns: filename, title, status, project, created_at
#         Sorted by date descending (newest first).

set -euo pipefail

die() { echo "ERROR: $1" >&2; exit 1; }

[[ $# -ge 1 ]] || die "Usage: list-plans.sh <plan_dir> [status_filter] [project_filter]"

PLAN_DIR="$1"
STATUS_FILTER="${2:-}"
PROJECT_FILTER="${3:-}"

[[ -d "$PLAN_DIR" ]] || die "Directory not found: $PLAN_DIR"

# Header
echo -e "FILENAME\tTITLE\tSTATUS\tPROJECT\tCREATED_AT"

# Process each markdown file, extract frontmatter fields
for f in "$PLAN_DIR"/*.md; do
  [[ -f "$f" ]] || continue

  # Parse YAML frontmatter using awk
  eval "$(awk '
    BEGIN { in_fm=0; title=""; status=""; project=""; created="" }
    NR==1 && /^---$/ { in_fm=1; next }
    in_fm && /^---$/ { in_fm=0; next }
    in_fm && /^title:/ { gsub(/^title:[[:space:]]*"?/, ""); gsub(/"$/, ""); title=$0 }
    in_fm && /^status:/ { gsub(/^status:[[:space:]]*/, ""); status=$0 }
    in_fm && /^project:/ { gsub(/^project:[[:space:]]*"?/, ""); gsub(/"$/, ""); project=$0 }
    in_fm && /^created_at:/ { gsub(/^created_at:[[:space:]]*/, ""); created=$0 }
    END {
      gsub(/"/, "\\\"", title)
      gsub(/"/, "\\\"", project)
      printf "FM_TITLE=\"%s\"\nFM_STATUS=\"%s\"\nFM_PROJECT=\"%s\"\nFM_CREATED=\"%s\"\n", title, status, project, created
    }
  ' "$f")"

  # Apply status filter
  if [[ -n "$STATUS_FILTER" && "$FM_STATUS" != "$STATUS_FILTER" ]]; then
    continue
  fi

  # Apply project filter (substring match)
  if [[ -n "$PROJECT_FILTER" && "$FM_PROJECT" != *"$PROJECT_FILTER"* ]]; then
    continue
  fi

  BASENAME="$(basename "$f")"
  echo -e "${BASENAME}\t${FM_TITLE}\t${FM_STATUS}\t${FM_PROJECT}\t${FM_CREATED}"
done | sort -t$'\t' -k5 -r
