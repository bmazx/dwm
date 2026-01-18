#!/bin/sh

battery() {
    total=0
    count=0
    for bat in /sys/class/power_supply/BAT*; do
        [ -e "$bat/capacity" ] || continue
        total=$((total + $(cat "$bat/capacity")))
        count=$((count + 1))
    done

    [ "$count" -gt 0 ] && cap=$(cat "$bat/capacity") || return
    status=$(cat "$bat/status")

    case "$status" in
        Charging) icon=" " ;;
        Full) icon=" " ;;
        "Not charging") icon=" " ;;
        Discharging)
            if [ "$cap" -lt 10 ]; then
                icon=" "
            elif [ "$cap" -lt 25 ]; then
                icon=" "
            elif [ "$cap" -lt 50 ]; then
                icon=" "
            elif [ "$cap" -lt 75 ]; then
                icon=" "
            else
                icon=" "
            fi
        ;;
        *) icon="" ;;
    esac

    echo "$icon $cap%"
}

battery
