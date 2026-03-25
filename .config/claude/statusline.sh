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

parse_epoch() {
  local val=$1
  # If it's already a number (unix epoch), return as-is
  if [[ "$val" =~ ^[0-9]+$ ]]; then
    printf '%s' "$val"
    return
  fi
  # Otherwise parse as ISO8601
  if date --version &>/dev/null; then
    date -d "$val" +%s 2>/dev/null
  else
    local stripped="${val%%.*}"
    date -juf '%Y-%m-%dT%H:%M:%SZ' "${stripped}Z" +%s 2>/dev/null \
      || date -jf '%Y-%m-%dT%H:%M:%S' "$stripped" +%s 2>/dev/null
  fi
}

fmt_duration() {
  local secs=$1
  (( secs < 0 )) && secs=0
  local d=$(( secs / 86400 ))
  local h=$(( (secs % 86400) / 3600 ))
  local m=$(( (secs % 3600) / 60 ))
  if (( d > 0 )); then
    printf '%dd%dh' "$d" "$h"
  elif (( h > 0 )); then
    printf '%dh%dm' "$h" "$m"
  else
    printf '%dm' "$m"
  fi
}

elapsed_label() {
  local resets_at=$1
  local total_secs=$2
  local denom=$3
  if [[ -z "$resets_at" ]]; then
    printf '%s' "$denom"
    return
  fi
  local epoch
  epoch=$(parse_epoch "$resets_at")
  if [[ -z "$epoch" ]]; then
    printf '%s' "$denom"
    return
  fi
  local now remaining elapsed
  now=$(date +%s)
  remaining=$(( epoch - now ))
  (( remaining < 0 )) && remaining=0
  elapsed=$(( total_secs - remaining ))
  (( elapsed < 0 )) && elapsed=0
  printf '%s/%s' "$(fmt_duration "$elapsed")" "$denom"
}

fmt() {
  local label=$1
  local pct=$2
  local p=$(( (pct + 0) ))
  printf '%s %s%s %d%%%b' "$label" "$(gradient "$pct")" "$(bar "$pct")" "$p" "$R"
}

data=$(cat)

model=$(printf '%s' "$data" | jq -r '.model.display_name // "Claude"')

parts=("$model")

ctx=$(printf '%s' "$data" | jq -r '.context_window.used_percentage // 0')
ctx_int=$(printf '%.0f' "$ctx")
parts+=("$(fmt 'ctx' "$ctx_int")")

five=$(printf '%s' "$data" | jq -r '.rate_limits.five_hour.used_percentage // 0')
five_int=$(printf '%.0f' "$five")
five_resets=$(printf '%s' "$data" | jq -r '.rate_limits.five_hour.resets_at // empty')
five_label=$(elapsed_label "$five_resets" 18000 '5h')
parts+=("$(fmt "$five_label" "$five_int")")

week=$(printf '%s' "$data" | jq -r '.rate_limits.seven_day.used_percentage // 0')
week_int=$(printf '%.0f' "$week")
week_resets=$(printf '%s' "$data" | jq -r '.rate_limits.seven_day.resets_at // empty')
week_label=$(elapsed_label "$week_resets" 604800 '7d')
parts+=("$(fmt "$week_label" "$week_int")")

session_id=$(printf '%s' "$data" | jq -r '.session_id // empty')
if [[ -n "$session_id" ]]; then
  parts+=("$(printf '%b%s%b' "$DIM" "$session_id" "$R")")
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
