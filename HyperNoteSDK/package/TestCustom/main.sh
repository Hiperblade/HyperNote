# ------------------------------------
# Package Test Run by Hiperblade
# ------------------------------------
PackageTestRun_Run()
{
	ConsoleAppendLine "Run started..."
	ConsoleAppendLine "Line 1"
	ConsoleAppendLine "Line 2"
	ConsoleAppendLine "Line 3"
	ConsoleAppendLine "bla"
	ConsoleAppendLine "bla"
	sleep 1
	ConsoleAppendLine "bla bla bla"
	ConsoleAppendLine "bla bla bla"
	ConsoleAppendLine "bla bla bla"
	sleep 1
	ConsoleAppendLine "etc"
	ConsoleAppendLine "Run terminated!"
}

PackageTestRun_PrintPage()
{
	ConsoleConfigure 16 $CONSOLE_MAX_ROW
	PrintPageTitle "Package Test Run 1.0" "by Hiperblade"
	ConsoleWriteLine 5 "This script prints some text on console"

	ConsoleWriteLine 15 "-= LOG =-"
}

# ------------------------------------
# START
# ------------------------------------
PackageTestRun_PrintPage
CHOICE=$NONE
while [ "$CHOICE" != $EXIT ]
do
	ShowButtons "BACK" $NONE $NONE "RUN" $NONE ""
	if [ "$CHOICE" = "BACK" ]; then
		CHOICE=$EXIT
	elif [ "$CHOICE" = "RUN" ]; then
		PackageTestRun_Run
		CHOICE=$NONE
	else
		CHOICE=$NONE
	fi
done