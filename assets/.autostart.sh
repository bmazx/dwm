dte()
{
	dte="$(date +"%a %H:%M:%S %m/%d/%Y")"
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
	sleep 0.5
	read cpu a b c idle rest < /proc/stat
	total=$((a+b+c+idle))
	cpu=$((100*((total-prevtotal)-(idle-previdle))/(total-prevtotal)))
	echo -e "$cpu% CPU"
}

xsetroot -name "CPU | MEM | DATE    "

while true; do
	xsetroot -name " $(cpu) | $(mem) | $(dte)    "
done &
