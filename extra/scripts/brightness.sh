#!/bin/sh

brightness() {
    cur=$(brightnessctl g)
    max=$(brightnessctl m)
    pct=$((100 * cur / max))

    if [ "$pct" -lt 11 ]; then
        icon=" "
    elif [ "$pct" -lt 22 ]; then
        icon=" "
    elif [ "$pct" -lt 33 ]; then
        icon=" "
    elif [ "$pct" -lt 44 ]; then
        icon=" "
    elif [ "$pct" -lt 55 ]; then
        icon=" "
    elif [ "$pct" -lt 66 ]; then
        icon=" "
    elif [ "$pct" -lt 77 ]; then
        icon=" "
    elif [ "$pct" -lt 88 ]; then
        icon=" "
    else
        icon=" "
    fi

    echo "$icon $pct%"
}

brightness
