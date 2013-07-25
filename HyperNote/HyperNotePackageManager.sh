# ------------------------------------
# Package Manager 1.0
# ------------------------------------
ShowPackageManagerPage()
{
	#Show PackageManager main page
	ConsoleConfigure 16 $CONSOLE_MAX_ROW
	PrintPageTitle "Package Manager 1.0" "by Hiperblade"

	ConsoleWriteLine 5 "This script manages the third-party packages"
	ConsoleWriteLine 6 "You can install, uninstall and run packages"

	ConsoleWriteLine 8 "For safety make a bakup of your device before use this script"
	ConsoleWriteLine 9 "I do not accept responsibility for any type"
	ConsoleWriteLine 10 "of direct or indirect damage caused by the use of this script"
	ConsoleWriteLine 11 "and the use of the third-party packages"
	
	ConsoleWriteLine 13 "(Use the arrows to navigate and the Home button to go back)"

	ConsoleWriteLine 15 "-= LOG =-"
}

PackageManager_PageNumber=0

PackageManager()
{
	ShowPackageManagerPage
	BUTTON_PAGE_CHOICE=$NONE
	while [ "$BUTTON_PAGE_CHOICE" != $EXIT ]
	do
		ShowButtonsPage $(ls ./package)
		if [ "$BUTTON_PAGE_CHOICE" != "$EXIT" ]; then
			# Execute the script
			if [ -f "./package/$BUTTON_PAGE_CHOICE/main.sh" ]; then
				PackageManager_PageNumber=$PageNumber;
				PackageTemplate_Clear
				export SCRIPT_DIRECTORY="./package/$BUTTON_PAGE_CHOICE"
				. "./package/$BUTTON_PAGE_CHOICE/main.sh" 2>>../log/errorPlugIn.log
				PageNumber=$PackageManager_PageNumber;
				ShowPackageManagerPage
			else
				ConsoleAppendLine "./package/$BUTTON_PAGE_CHOICE/main.sh not exist!"
			fi
		fi
	done
}