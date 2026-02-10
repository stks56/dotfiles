---
name: create-persistence-plan
description: Persist Claude Code plan files across sessions. Use this skill PROACTIVELY after creating or approving a plan in plan mode to automatically save it. Also use when the user asks to list saved plans, restore a plan, resume from a plan, show saved plans, archive a plan, or update plan status.
---

# Plan Persistence

Save, list, restore, and manage Claude Code plan files (`.claude/plans/`) across sessions.

## Storage Location

Resolve the plan storage directory:

```
PLAN_DIR="${CLAUDE_CODE_PLAN_DIR:-$HOME/.local/share/claude-plans}"
```

## Operations

### 1. Save a Plan (Proactive — run after plan creation/approval)

After a plan is created or approved in plan mode, automatically save it.

**Steps:**

1. Identify the plan file in `.claude/plans/` (the file just created/approved)
2. Extract the title from the first H1 heading (`# ...`) in the plan content
3. Resolve `PLAN_DIR` as above
4. Run the save script:

```bash
bash <skill_path>/scripts/save-plan.sh \
  "<plan_file_path>" \
  "$PLAN_DIR" \
  "<title>" \
  "<project_root_path>" \
  "in_progress"
```

5. Report the saved file path to the user

**Filename format:** `YYYY-MM-DD:HH-<title>.md` (title kept in original language, e.g. Japanese)

### 2. List Saved Plans

When the user asks to see saved plans.

**Steps:**

1. Resolve `PLAN_DIR`
2. Run:

```bash
bash <skill_path>/scripts/list-plans.sh "$PLAN_DIR" [status_filter] [project_filter]
```

3. Present the TSV output as a formatted table

**Filters:**
- Status: `in_progress`, `completed`, `archived`
- Project: substring match on the project path

### 3. Restore a Plan (Copy mode)

When the user wants to resume work from a saved plan.

**Steps:**

1. List plans (operation 2) and let the user choose one
2. Run the restore script:

```bash
bash <skill_path>/scripts/restore-plan.sh \
  "$PLAN_DIR/<selected_file>" \
  "<project_root_path>"
```

3. The script strips frontmatter and copies to `.claude/plans/`
4. Report the restored path — the user can now continue in plan mode

### 4. Update Plan Status

When the user wants to mark a plan as completed or archived.

**Steps:**

1. List plans (operation 2) and identify the target file
2. Use the Edit tool to change the `status:` field in the frontmatter:
   - `in_progress` → `completed` or `archived`
   - `completed` → `archived`
3. Update `saved_at` to the current UTC timestamp
4. Confirm the status change

## Frontmatter Schema

See `references/frontmatter-spec.md` for full schema, field details, and status transition rules.

Required fields: `title`, `original_file`, `project`, `status`, `created_at`, `saved_at`
Optional fields: `tags`, `related_issue`, `notes`
