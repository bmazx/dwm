//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{" ", "free --mega | awk '/Mem/ {printf \"%d/%d MB (%.2f%%)\", $3, $2, ($3/$2)*100}'",	1, 0},  /* Memory  */
	{"", "/home/$USER/.config/dwmblocks/scripts/volume.sh", 1, 0},
	{" ", "date +\"%H:%M:%S %a %m/%d/%Y\"", 1, 1},							/* Time & Calender  */
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
