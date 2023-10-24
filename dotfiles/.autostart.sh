vol()
{
	vol="$(amixer get Master | awk -F'[][]' 'END{ print $2 }' | tr -d "%")"
	volmute=$(amixer get Master | awk -F'[][]' 'END{print $6}')

	if [ "$volmute" = "off" ]; then
		icon=""
		echo -e "$icon"
		return
	elif [ "$vol" -gt "60" ]; then
		icon=""
	elif [ "$vol" -lt "20" ]; then
		icon=""
	else
		icon=""
	fi

	echo -e "$icon $vol%"
}

wifi()
{
	up=$(ip link | awk '{if ($0 ~ /state UP/) { print "1" } else if ($0 ~ /state DOWN/) { print "0" }}')
	if [ "$up" = "1" ]; then
		wifi=" "
	else
		wifi="! "
	fi

	echo -e "$wifi"
}

dte()
{
	dte="$(date +"%H:%M:%S %a %m/%d/%Y")"
	echo -e "$dte"
}

mem()
{
	mem="$(free --mega | awk '/Mem/ {printf "%d/%d MB (%.2f%%)", $3, $2, ($3/$2)*100}')"
	echo -e "$mem"
}

cpu()
{
	read cpu a b c previdle rest < /proc/stat
	prevtotal=$((a+b+c+previdle))
	sleep 0.3
	read cpu a b c idle rest < /proc/stat
	total=$((a+b+c+idle))
	cpu=$((100*((total-prevtotal)-(idle-previdle))/(total-prevtotal)))
	if [ "$cpu" -lt "10" ]; then
		echo -e " $cpu% CPU"
	else
		echo -e "$cpu% CPU"
	fi
}

xsetroot -name "CPU | MEM | DATE"

while true; do
	xsetroot -name " $(cpu) |  $(mem) | $(wifi) | $(vol) |  $(dte)"
done &
