#!/usr/bin/env bash
# Pattern 4: Fine-grained progress bar with true color gradient

BLOCKS=' ▏▎▍▌▋▊▉█'
R='\033[0m'
DIM='\033[2m'

gradient() {
  local pct=$1
  if (( pct < 50 )); then
    local r=$(( pct * 51 / 10 ))
    printf '\033[38;2;%d;200;80m' "$r"
  else
    local g=$(( 200 - (pct - 50) * 4 ))
    (( g < 0 )) && g=0
    printf '\033[38;2;255;%d;60m' "$g"
  fi
}

bar() {
  local pct=$1
  local width=${2:-10}
  (( pct < 0 )) && pct=0
  (( pct > 100 )) && pct=100
  local filled_x8=$(( pct * width * 8 / 100 ))
  local full=$(( filled_x8 / 8 ))
  local frac=$(( filled_x8 % 8 ))
  local b=''
  local i
  for (( i = 0; i < full; i++ )); do
    b+='█'
  done
  if (( full < width )); then
    b+="${BLOCKS:$frac:1}"
    for (( i = full + 1; i < width; i++ )); do
      b+='░'
    done
  fi
  printf '%s' "$b"
}

fmt() {
  local label=$1
  local pct=$2
  local p=$(( (pct + 0) ))  # already integer from jq
  printf '%s %s%s %d%%%b' "$label" "$(gradient "$pct")" "$(bar "$pct")" "$p" "$R"
}

data=$(cat)

model=$(printf '%s' "$data" | jq -r '.model.display_name // "Claude"')

parts=("$model")

ctx=$(printf '%s' "$data" | jq -r '.context_window.used_percentage // empty')
if [[ -n "$ctx" ]]; then
  ctx_int=$(printf '%.0f' "$ctx")
  parts+=("$(fmt 'ctx' "$ctx_int")")
fi

five=$(printf '%s' "$data" | jq -r '.rate_limits.five_hour.used_percentage // empty')
if [[ -n "$five" ]]; then
  five_int=$(printf '%.0f' "$five")
  parts+=("$(fmt '5h' "$five_int")")
fi

week=$(printf '%s' "$data" | jq -r '.rate_limits.seven_day.used_percentage // empty')
if [[ -n "$week" ]]; then
  week_int=$(printf '%.0f' "$week")
  parts+=("$(fmt '7d' "$week_int")")
fi

sep=$(printf '%b' "${DIM}│${R}")
first=1
for p in "${parts[@]}"; do
  if (( first )); then
    first=0
  else
    printf '%s' "$sep"
  fi
  printf ' %s ' "$p"
done
