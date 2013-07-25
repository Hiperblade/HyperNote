HyperNote_AddLib "HyperNotePackageTemplate 1.0             by Hiperblade"
# ------------------------------------
# Package Template
# ------------------------------------
NOTINSTALLED="(notinstalled)"
NOTUPDATED="(notupdate)"
INSTALLED="(installed)"
UNKNOWN="(unknown)"

PackageTemplate_Start()
{
	PackageTemplate_PrintPage
	PackageTemplate_PrintState
	CHOICE=$NONE
	while [ "$CHOICE" != $EXIT ]
	do
		PackageTemplate_GetState
		if [ "$CURRENT_STATE" = "$NOTINSTALLED" ]; then
			ShowButtons "BACK" $NONE "INSTALL" $NONE $NONE ""
		elif [ "$CURRENT_STATE" = "$NOTUPDATED" ]; then
			ShowButtons "BACK" $NONE "UPDATE" $NONE "UNINSTALL" ""
		elif [ "$CURRENT_STATE" = "$INSTALLED" ]; then
			ShowButtons "BACK" $NONE $NONE $NONE "UNINSTALL" ""
		else
			ShowButtons "BACK" $NONE $NONE "RUN" $NONE ""
		fi

		if [ "$CHOICE" = "BACK" ]; then
			CHOICE=$EXIT
		elif [ "$CHOICE" = "INSTALL" ]; then
			PackageTemplate_Install
			PackageTemplate_PrintState
			CHOICE=$NONE
		elif [ "$CHOICE" = "UPDATE" ]; then
			PackageTemplate_Update
			PackageTemplate_PrintState
			CHOICE=$NONE
		elif [ "$CHOICE" = "UNINSTALL" ]; then
			PackageTemplate_UnIntstall
			PackageTemplate_PrintState
			CHOICE=$NONE
		elif [ "$CHOICE" = "RUN" ]; then
			PackageTemplate_Run
			PackageTemplate_PrintState
			CHOICE=$NONE
		else
			CHOICE=$NONE
		fi
	done
}

PackageTemplate_PrintState()
{
	ConsoleClearLine $CONSOLE_MAX_ROW
	PackageTemplate_GetState
	if [ "$CURRENT_STATE" = "$NOTINSTALLED" ]; then
		ConsoleWriteLine $CONSOLE_MAX_ROW "State: NOT installed"
	elif [ "$CURRENT_STATE" = "$NOTUPDATED" ]; then
		ConsoleWriteLine $CONSOLE_MAX_ROW "State: Installed but not updated"
	elif [ "$CURRENT_STATE" = "$INSTALLED" ]; then
		ConsoleWriteLine $CONSOLE_MAX_ROW "State: Installed"
	fi
}

PackageTemplate_Clear()
{
	PackageTemplate_Install()
	{
		PackageTemplate_None
	}

	PackageTemplate_Update()
	{
		PackageTemplate_None
	}

	PackageTemplate_UnIntstall()
	{
		PackageTemplate_None
	}

	PackageTemplate_Run()
	{
		PackageTemplate_None
	}

	PackageTemplate_PrintPage()
	{
		PackageTemplate_None
	}

	PackageTemplate_GetState()
	{
		CURRENT_STATE=$UNKNOWN
	}
}

PackageTemplate_None()
{
	FAKE="fake"
}