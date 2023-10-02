//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		    /*Update Interval*/	/*Update Signal*/
	{"",        "sb-pacpackages",   0,                   8},
	{"",        "sb-volume",        0,                   2},
	{"",        "sb-clock",         30,                  1},
	{"",        "sb-layout",        0,                   10},
	{"",        "sb-internet",      60,                  4},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 3;
