#!/bin/sh

network() {
    for i in /sys/class/net/*; do
        iface=$(basename "$i")
        [ "$iface" = "lo" ] && continue
        [ "$(cat "$i/operstate")" != "up" ] && continue

        if [ -d "$i/wireless" ]; then
            sig=$(iw dev "$iface" link 2>/dev/null | awk '/signal/ {
                s=$2; p=(s+90)*100/60;
                if(p>100)p=100;if(p<0)p=0;
                printf "%d%%",p
            }')
            echo "  $sig"
        else
            echo "$iface"
        fi
        return
    done
    echo "! "
}

network
