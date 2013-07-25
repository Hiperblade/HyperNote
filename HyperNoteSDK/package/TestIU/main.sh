# ------------------------------------
# Package Test Install/Update/Uninstall by Hiperblade
# ------------------------------------
PackageTemplate_Install()
{
	FILE="$SCRIPT_DIRECTORY/Data/TestIU.xml"
	cp -f $FILE /eTablet/etc/launcher/ 2>>../log/error.log

	# copy icons
	#IconAdd "$DIR/icon_b_test.png"
	#IconAdd "$DIR/icon_s_test.png"

	# add info
	#StartMenuApplicationAdd "PackageTestIU" "test" "Startup" "icon_s_test.png" "icon_b_test.png" "note..."
	#ApplicationConfigAdd "test" "test" 1

	ConsoleAppendLine "Istallation done!"
}

PackageTemplate_Update()
{
	FILE="$SCRIPT_DIRECTORY/Data/TestIU.xml"
	cp -f $FILE /eTablet/etc/launcher/ 2>>../log/error.log

	ConsoleAppendLine "Update done!"
}

PackageTemplate_UnIntstall()
{
	#StartMenuApplicationRemove "PackageTestIU"
	#ApplicationConfigRemove "test"
	#IconRemove "icon_b_test.png"
	#IconRemove "icon_s_test.png"
	rm -f /eTablet/etc/launcher/TestIU.xml 2>>../log/error.log

	ConsoleAppendLine "Unistallation done!"
}

PackageTemplate_PrintPage()
{
	ConsoleConfigure 16 $CONSOLE_MAX_ROW
	PrintPageTitle "Package Test Install/Update/Uninstall 1.0" "by Hiperblade"
	ConsoleWriteLine 5 "This script copy a xml file in the /eTablet/etc/launcher/ directory"

	ConsoleWriteLine 15 "-= LOG =-"
}

PackageTemplate_GetState()
{
	CURRENT_STATE=$UNKNOWN
	if [ ! -f /eTablet/etc/launcher/TestIU.xml ]; then
		CURRENT_STATE=$NOTINSTALLED
	else
#    size=`ls -l /eTablet/etc/launcher/TestIU.xm | awk '{print $5}'`
#		if [ $size -ne <XXX> ]; then
#			CURRENT_STATE=$NOTUPDATED
#		else
			CURRENT_STATE=$INSTALLED
#		fi
	fi
}

# ------------------------------------
# START
# ------------------------------------
PackageTemplate_Start