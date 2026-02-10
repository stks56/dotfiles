# Frontmatter Specification for Persisted Plans

## Schema

```yaml
---
title: "Plan title"                              # Required. Extracted from H1 heading.
original_file: "/path/to/.claude/plans/xxx.md"   # Required. Absolute path to source file.
project: "/path/to/project"                      # Required. Absolute path of the project root.
status: in_progress                              # Required. One of: in_progress, completed, archived.
created_at: 2026-02-02T16:30:00Z                 # Required. UTC ISO 8601 timestamp.
saved_at: 2026-02-02T16:30:00Z                   # Required. UTC ISO 8601, updated on re-save.
tags: [auth, backend]                            # Optional. Free-form labels.
related_issue: "https://github.com/org/repo/123" # Optional. Associated issue/PR URL.
notes: "Additional context"                      # Optional. Free text.
---
```

## Field Details

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `title` | string | Yes | Plan title. Extracted from the first H1 (`# ...`) in the plan file. Kept in original language (Japanese preserved). Quoted in YAML to handle special characters. |
| `original_file` | string | Yes | Absolute path to the original `.claude/plans/` file. Used by restore to determine destination filename. |
| `project` | string | Yes | Absolute path of the project root directory (e.g., `/Users/user/myproject`). Used for filtering plans by project. |
| `status` | enum | Yes | Current status. See Status Transitions below. |
| `created_at` | string | Yes | UTC timestamp in ISO 8601 format. Set once at initial save. |
| `saved_at` | string | Yes | UTC timestamp in ISO 8601 format. Updated each time the plan is re-saved. |
| `tags` | list | No | YAML list of free-form string labels for categorization. |
| `related_issue` | string | No | URL to a related GitHub issue or pull request. |
| `notes` | string | No | Free-form text for additional context or notes. |

## Status Transitions

```
in_progress ──→ completed
in_progress ──→ archived
completed   ──→ archived
```

- **in_progress**: Plan is actively being implemented. Default status on save.
- **completed**: Implementation of the plan is finished.
- **archived**: Plan is no longer relevant (superseded, abandoned, or kept for reference).

Status updates are performed by editing the `status:` line in the frontmatter directly (via `sed` or Claude's Edit tool).

## Filename Convention

Format: `YYYY-MM-DD:HH-タスク名.md`

- Date/hour prefix from `date +%Y-%m-%d:%H` at save time
- Task name extracted from the first H1 heading in the plan content
- Japanese and other non-ASCII characters are preserved as-is (no transliteration)
- If a file with the same name exists, append `_2`, `_3`, etc. before `.md`

Examples:
- `2026-02-02:16-Repository層実装計画.md`
- `2026-02-10:09-認証フロー設計.md`
- `2026-02-10:09-認証フロー設計_2.md` (duplicate)
