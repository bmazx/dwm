#!/bin/sh

volume() {
    vol=$(amixer get Master | awk -F'[][]' 'END {print $2}' | tr -d "%")
    mute=$(amixer get Master | awk -F'[][]' 'END {print $4}')

    if [ "$mute" = "off" ]; then
        icon="! "
    elif [ "$vol" -lt 33 ]; then
        icon=" "
    elif [ "$vol" -lt 66 ]; then
        icon=" "
    else
        icon=" "
    fi

    echo "$icon $vol%"
}

volume
