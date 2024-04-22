#!/bin/sh

function gen_environments()
{
    distrobox list | awk -F'|' 'NR>1 {gsub(/^[ \t]+|[ \t]+$/, "", $2); print $2}'
}

DEVENV=$( (gen_environments) | rofi -dmenu -p "Env:")

if [ -n "${DEVENV}" ]
then
    foot -e distrobox enter "${DEVENV}"
fi
