#!/usr/bin/env bash

# This i3status wrapper allows to add custom information in any position of the statusline
# It was developed for i3bar (JSON format)

# The idea is to define "holder" modules in i3status config and then replace them

# In order to make this example work you need to add
# order += "tztime holder__hey_man"
# and
# tztime holder__hey_man {
#        format = "holder__hey_man"
# }
# in i3staus config

# Don't forget that i3status config should contain:
# general {
#   output_format = i3bar
# }
#
# and i3 config should contain:
# bar {
#   status_command exec /path/to/this/script.sh
# }

# Make sure jq is installed
# That's it

# You can easily add multiple custom modules using additional "holders"

# Values reach jq via --arg, never string interpolation, so any byte is escaped
# for us. A failed probe keeps the last good value; a failed jq falls back to the
# untouched i3status array. Never print a line that is not valid JSON: i3bar
# parses the whole stream as one document.

dunst="Dunst: ?"; dunst_color="#FFFF00"
keyboard="K: ?"; bt="BT: ?"; ram=""; uptime=""

function sanitize {
  printf '%s' "$1" | tr '\n\t\r' '   ' \
    | sed -e 's/\x1B\[[0-9;?]*[A-Za-z]//g' -e 's/  */ /g' -e 's/^ //' -e 's/ $//'
}

# Not callable inside $( ) - the cache update would be lost to the subshell.
function probe {
  local cvar=$1 prefix=$2; shift 2
  local out; out=$(sanitize "$("$@" 2>/dev/null)")
  [ -n "$out" ] && printf -v "$cvar" '%s%s' "$prefix" "$out"
}

function probe_json {
  local cvar=$1; shift
  local out; out=$("$@" 2>/dev/null | head -n 1)
  printf '%s' "$out" | jq -e 'type == "object"' >/dev/null 2>&1 \
    && printf -v "$cvar" '%s' "$out"
}

function kb_layout {
  setxkbmap -query | awk '/^layout:/{print $2; exit}'
}

readonly FILTER='
  def block($t; $c): if $c == "" then {full_text:$t} else {full_text:$t, color:$c} end;
  def parsed($raw; $fb): (($raw | fromjson?) | select(type=="object")) // {full_text:$fb};
  # battery leaves trailing spaces when %remaining/%emptytime are empty
  def trim: if has("full_text")
            then .full_text |= (sub("\\s+$";"") | sub("\\s+(?<t></[^>]+>)$";.t))
            else . end;
  map(
    if   .instance == "holder__dunst_paused" then block($dunst; $dunst_color)
    elif .instance == "holder__keyboard"     then block($keyboard; "")
    elif .instance == "holder__bt_battery"   then block($bt; "")
    elif .instance == "holder__conky_ram"    then parsed($ram; "RAM ?")
    elif .instance == "holder__conky_uptime" then parsed($uptime; "Uptime ?")
    else . end
    | trim)'

i3status | {
  IFS= read -r line; printf '%s\n' "$line"
  IFS= read -r line; printf '%s\n' "$line"

  sep=""
  while IFS= read -r line; do
    blocks=${line#,}
    [ -n "$blocks" ] || continue

    case "$(dunstctl is-paused 2>/dev/null)" in
      true)  dunst="Dunst: off"; dunst_color="#FF0000" ;;
      false) dunst="Dunst: on";  dunst_color=""        ;;
    esac
    probe keyboard "K: " kb_layout
    probe bt "BT: " bluetooth-device-battery
    probe_json ram    i3conkyWrapper ram
    probe_json uptime i3conkyWrapper uptime

    out=$(printf '%s' "$blocks" | jq -c \
      --arg dunst "$dunst" --arg dunst_color "$dunst_color" \
      --arg keyboard "$keyboard" --arg bt "$bt" \
      --arg ram "$ram" --arg uptime "$uptime" \
      "$FILTER" 2>/dev/null)

    # jq can exit 0 and still print nothing, so test the string.
    [ -n "$out" ] || out=$blocks

    printf '%s%s\n' "$sep" "$out"
    sep=","
  done
}
