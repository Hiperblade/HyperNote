HyperNote_AddLib "HyperNoteConsole 1.0                     by Hiperblade"
# ------------------------------------
# Console (45x90)
# ------------------------------------
CONSOLE_Y_POSITION=279
CONSOLE_MAX_ROW=44

CONSOLE_CURRENT_ROW=0 #0..44 (45 rows)

# --------------------------------------
# Reset the console
# --------------------------------------
ConsoleReset()
{
	CONSOLE_CURRENT_ROW=0 #(CONSOLE_INITIAL_ROW - 1)
	CONSOLE_INITIAL_ROW=1
	CONSOLE_FINAL_ROW=$CONSOLE_MAX_ROW
	CONSOLE_COLOR_BACKGROUND=120
	CONSOLE_COLOR_TEXT=255
}

# --------------------------------------
# Configure the console
# --------------------------------------
# $1 initial row
# $2 final row
# [$3] background color
# [$4] text color
ConsoleConfigure()
{
	CONSOLE_CURRENT_ROW=$(($1-1))
	CONSOLE_INITIAL_ROW=$1
	CONSOLE_FINAL_ROW=$2
	if [ $# = 4 ]; then
		CONSOLE_COLOR_BACKGROUND=$3
		CONSOLE_COLOR_TEXT=$4
	else
		CONSOLE_COLOR_BACKGROUND=120
		CONSOLE_COLOR_TEXT=255
	fi
}

# --------------------------------------
# Write line at point
# --------------------------------------
# $1 y coord
# $2 text
# [$3] color
ConsoleWriteLineAt()
{
	if [ $# = 3 ]; then
		fbecho -centertext 384,$1,$3,"$2"
	else
		fbecho -centertext 384,$1,$CONSOLE_COLOR_TEXT,"$2"
	fi
}

# --------------------------------------
# Write line at row position
# --------------------------------------
# $1 numberOfRow
# $2 text
# [$3] color
ConsoleWriteLine()
{
	Console_Row_Position=$((($1*15)+$CONSOLE_Y_POSITION+7))
	if [ $# = 3 ]; then
		fbecho -centertext 384,$Console_Row_Position,$3,"$2"
	else
		fbecho -centertext 384,$Console_Row_Position,$CONSOLE_COLOR_TEXT,"$2"
	fi
}

# --------------------------------------
# Add line to log
# --------------------------------------
# $1 text
# [$2] color
ConsoleAppendLine()
{
	if [ $CONSOLE_CURRENT_ROW = $CONSOLE_FINAL_ROW ]; then
		CONSOLE_CURRENT_ROW=$CONSOLE_INITIAL_ROW
		ConsoleClear $CONSOLE_INITIAL_ROW $CONSOLE_FINAL_ROW
	else
		CONSOLE_CURRENT_ROW=$(($CONSOLE_CURRENT_ROW+1))
	fi
	Console_Row_Position=$((($CONSOLE_CURRENT_ROW*15)+$CONSOLE_Y_POSITION+7))
	if [ $# = 2 ]; then
		fbecho -centertext 384,$Console_Row_Position,$2,"$1"
	else
		fbecho -centertext 384,$Console_Row_Position,$CONSOLE_COLOR_TEXT,"$1"
	fi
}

# --------------------------------------
# Clean the console
# --------------------------------------
# [$1] numberOfRowFrom
# [$2] numberOfRowTo
ConsoleClear()
{
	if [ $# = 0 ]; then
		numberOfRowFrom=0
		numberOfRowTo=$CONSOLE_MAX_ROW
	elif [ $# = 1 ]; then
		numberOfRowFrom=$1
		numberOfRowTo=$1
	else
		numberOfRowFrom=$1
		numberOfRowTo=$2
	fi
	fbecho -fillrect 10,$((($numberOfRowFrom*15)+$CONSOLE_Y_POSITION)),758,$(((($numberOfRowTo+1)*15)+$CONSOLE_Y_POSITION)),$CONSOLE_COLOR_BACKGROUND
}

# --------------------------------------
# Clean the console
# --------------------------------------
# $1 numberOfRow
# [$2] color
ConsoleClearLine()
{
	numberOfRowFrom=$1
	numberOfRowTo=$1

	if [ $# = 2 ]; then
		COLOR=$2
	else
		COLOR=$CONSOLE_COLOR_BACKGROUND
	fi
	
	fbecho -fillrect 10,$((($numberOfRowFrom*15)+$CONSOLE_Y_POSITION)),758,$(((($numberOfRowTo+1)*15)+$CONSOLE_Y_POSITION)),$COLOR
}
# "title" "subtitle"
PrintPageTitle()
{
	ConsoleClear
	fbecho -rect 17,286,751,318,$CONSOLE_COLOR_TEXT
	fbecho -rect 19,288,749,316,$CONSOLE_COLOR_TEXT
	fbecho -centertext 384,302,$CONSOLE_COLOR_TEXT,"$1"
	fbecho -centertext 384,332,$CONSOLE_COLOR_TEXT,"$2"
}

ConsoleReset