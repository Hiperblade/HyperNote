# ------------------------------------
# Menu Manager 1.0
# ------------------------------------
VISIBLE="X"
HIDDEN=" "

StartMenuManagerLoadFile()
{
	StartMenuManagerLoad $(cat /eTablet/etc/launcher/Config.xml | sed -n -e '/[<-]Ap /p' | sed 's/.*</</g' | sed 's/ /#/g' | sed 's/<!--/<--/g')
}

StartMenuManagerShowPage()
{
	ConsoleConfigure $CONSOLE_MAX_ROW $CONSOLE_MAX_ROW
	PrintPageTitle "Start menu' manage  1.0" "by Hiperblade"

	ConsoleWriteLine 5 "This EXPERIMENTAL script manages the application menu"
	ConsoleWriteLine 6 "You can hide and change the order of the icons"

	ConsoleWriteLine 8 "For safety make a bakup of your device before use this script"
	ConsoleWriteLine 9 "I do not accept responsibility for any type"
	ConsoleWriteLine 10 "of direct or indirect damage caused by the use of this script"

	ConsoleWriteLine 12 "(Use the arrows to navigate and the Home button to go back)"

	ConsoleWriteLine 15 "       Name                                           "

	START_LINE_NUMBER=15
	StartMenuCurrent=1
	INDEX=1
	while [ $INDEX -lt $StartMenuManagerMax ]
	do
		StartMenuManagerShowLine $INDEX
		INDEX=$(($INDEX+1))
	done
}

StartMenuManager()
{
	MountFileSystem
	#	backup
	if [ ! -f ./MenuManagerDefault.xml ]; then
		cp /eTablet/etc/launcher/Config.xml ./MenuManagerDefault.xml
	fi
	if [ ! -f ./MenuManagerBackup.xml ]; then
		cp /eTablet/etc/launcher/Config.xml ./MenuManagerBackup.xml
	fi

	StartMenuManagerLoadFile
	StartMenuManagerShowPage
	CHOICE=$NONE
	while [ "$CHOICE" != $EXIT ]
	do
		ShowButtons "FILE" $NONE "UP" "DOWN" "HIDE-SHOW" "LHR"
		if [ "$CHOICE" = $HOME ]; then
			CHOICE=$EXIT
		elif [ "$CHOICE" = "FILE" ]; then
			StartMenuManagerFile
			if [ "$CHOICE" != $EXIT ]; then
				StartMenuManagerShowPage
				CHOICE=$NONE
			fi
		elif [ "$CHOICE" = "UP" ]; then
			StartMenuManagerMoveUp
			CHOICE=$NONE
		elif [ "$CHOICE" = "DOWN" ]; then
			StartMenuManagerMoveDown
			CHOICE=$NONE
		elif [ "$CHOICE" = "HIDE-SHOW" ]; then
			StartMenuManagerHideShow
			CHOICE=$NONE
		elif [ "$CHOICE" = $LEFT ]; then
			StartMenuManagerSelectionMoveUp
			CHOICE=$NONE
		elif [ "$CHOICE" = $RIGHT ]; then
			StartMenuManagerSelectionMoveDown
			CHOICE=$NONE
		else
			CHOICE=$NONE
		fi
	done
}

StartMenuManagerFile()
{
	CHOICE_EXIT=$NONE
	while [ "$CHOICE_EXIT" != $EXIT ]
	do
		ShowButtons "BACK" "BACKUP" "RESTORE" "DEFAULT" "APPLY" ""
		if [ "$CHOICE" = "BACK" ]; then
			CHOICE_EXIT=$EXIT
		elif [ "$CHOICE" = "APPLY" ]; then
			StartMenuManagerApply
			StartMenuManagerLoadFile
			CHOICE_EXIT=$NONE
			ConsoleAppendLine "Elaboration complete"
		elif [ "$CHOICE" = "BACKUP" ]; then
			cp /eTablet/etc/launcher/Config.xml ./MenuManagerBackup.xml
			CHOICE_EXIT=$NONE
			ConsoleAppendLine "Elaboration complete"
		elif [ "$CHOICE" = "DEFAULT" ]; then
			cp ./MenuManagerDefault.xml /eTablet/etc/launcher/Config.xml
			StartMenuManagerLoadFile
			CHOICE_EXIT=$NONE
			ConsoleAppendLine "Elaboration complete"
		elif [ "$CHOICE" = "RESTORE" ]; then
			cp ./MenuManagerBackup.xml /eTablet/etc/launcher/Config.xml
			StartMenuManagerLoadFile
			CHOICE_EXIT=$NONE
			ConsoleAppendLine "Elaboration complete"
		fi
		CHOICE=$NONE
	done
}

StartMenuManagerLoad()
{
	INDEX=1
	while [ $INDEX -le $# ]
	do
		eval TMP="\$$INDEX"
		VALUE="$(echo "$TMP" | sed 's/#/ /g' | sed 's/<--/</g' | sed 's/-->/>/g')"
		eval StartMenuManagerValue_$INDEX="\$VALUE"
		VALUE="$(echo "$TMP" | sed -n 's/.*name="//p' | sed -n 's/".*//p' | sed 's/#/ /g')"
		eval StartMenuManagerDescription_$INDEX=\$VALUE
		VALUE=$(echo "$TMP" | sed -n 's/.*<//p' | sed 's/#.*//g')
		if [ "$VALUE" = "Ap" ]; then
			eval StartMenuManagerState_$INDEX=\$VISIBLE
		else # --Ap
			eval StartMenuManagerState_$INDEX=\$HIDDEN
		fi
		INDEX=$(($INDEX+1))
	done
	StartMenuManagerMax=$INDEX
}

#	ConsoleAppendLine " [X] Sudoku"
# $1 position
StartMenuManagerShowLine()
{
	if [ $1 -eq $StartMenuCurrent ]; then
		COLOR_BACK=$CONSOLE_COLOR_TEXT
		COLOR_TEXT=$CONSOLE_COLOR_BACKGROUND
	else
		COLOR_BACK=$CONSOLE_COLOR_BACKGROUND
		COLOR_TEXT=$CONSOLE_COLOR_TEXT
	fi
	eval MenuDescription=\$StartMenuManagerDescription_$1
	MenuDescription="$(echo "$MenuDescription                                                      -" | cut -c1-49)"
	eval MenuState=\$StartMenuManagerState_$1
	LINE_NUMBER=$(($1+$START_LINE_NUMBER))
	fbecho -fillrect 100,$((($LINE_NUMBER*15)+$CONSOLE_Y_POSITION)),658,$(((($LINE_NUMBER+1)*15)+$CONSOLE_Y_POSITION)),$COLOR_BACK
	if [ "$MenuState" = "$VISIBLE" ]; then
		fbecho -centertext 384,$((($LINE_NUMBER*15)+$CONSOLE_Y_POSITION+7)),$COLOR_TEXT," [X] $MenuDescription"
	else
		fbecho -centertext 384,$((($LINE_NUMBER*15)+$CONSOLE_Y_POSITION+7)),$COLOR_TEXT," [ ] $MenuDescription"
	fi
}

StartMenuManagerSwap()
{
	eval MenuDescription=\$StartMenuManagerDescription_$1
	eval MenuValue=\$StartMenuManagerValue_$1
	eval MenuState=\$StartMenuManagerState_$1
	eval StartMenuManagerDescription_$1=\$StartMenuManagerDescription_$2
	eval StartMenuManagerValue_$1=\$StartMenuManagerValue_$2
	eval StartMenuManagerState_$1=\$StartMenuManagerState_$2
	eval StartMenuManagerDescription_$2=\$MenuDescription
	eval StartMenuManagerValue_$2=\$MenuValue
	eval StartMenuManagerState_$2=\$MenuState
	StartMenuManagerShowLine $1
	StartMenuManagerShowLine $2
}

StartMenuManagerSelectionMoveUp()
{
	if [ $StartMenuCurrent -gt 1 ]; then
		OLD_POSITION=$StartMenuCurrent
		StartMenuCurrent=$(($StartMenuCurrent-1))
		StartMenuManagerShowLine $OLD_POSITION
		StartMenuManagerShowLine $StartMenuCurrent
	fi
}

StartMenuManagerSelectionMoveDown()
{
	if [ $StartMenuCurrent -lt $(($StartMenuManagerMax-1)) ]; then
		OLD_POSITION=$StartMenuCurrent
		StartMenuCurrent=$(($StartMenuCurrent+1))
		StartMenuManagerShowLine $OLD_POSITION
		StartMenuManagerShowLine $StartMenuCurrent
	fi
}

StartMenuManagerMoveUp()
{
	if [ $StartMenuCurrent -gt 1 ]; then
		OLD_POSITION=$StartMenuCurrent
		StartMenuCurrent=$(($StartMenuCurrent-1))
		StartMenuManagerSwap $OLD_POSITION $StartMenuCurrent
	fi
}

StartMenuManagerMoveDown()
{
	if [ $StartMenuCurrent -lt $(($StartMenuManagerMax-1)) ]; then
		OLD_POSITION=$StartMenuCurrent
		StartMenuCurrent=$(($StartMenuCurrent+1))
		StartMenuManagerSwap $OLD_POSITION $StartMenuCurrent
	fi
}

StartMenuManagerHideShow()
{
	eval MenuState=\$StartMenuManagerState_$StartMenuCurrent
	if [ "$MenuState" = "$VISIBLE" ]; then
		eval StartMenuManagerState_$StartMenuCurrent=\$HIDDEN
	else
		eval StartMenuManagerState_$StartMenuCurrent=\$VISIBLE
	fi
	StartMenuManagerShowLine $StartMenuCurrent
}

StartMenuManagerApply()
{
	cat /eTablet/etc/launcher/Config.xml | sed -e '/<Ap /d' | sed -e '/<!--Ap /d' | sed -e '/^[ \t]*$/d' > ./Config.xml
	INDEX=1
	while [ $INDEX -lt $StartMenuManagerMax ]
	do
		eval ENTRY=\$StartMenuManagerValue_$INDEX
		ENTRY="$(echo "$ENTRY" | sed 's/\//\\\//g')"
		eval MenuState=\$StartMenuManagerState_$INDEX
		if [ "$MenuState" = "$VISIBLE" ]; then
			CMD="cat ./Config.xml | sed 's/<\/AppList>/    $ENTRY\n    <\/AppList>/g' > ./Config.xml"
			eval $CMD
		else
			ENTRY="$(echo "$ENTRY" | sed 's/<Ap /<!--Ap /g' | sed 's/\/>/\/-->/g')"
			echo $ENTRY >> ./Config.xml
		fi
		INDEX=$(($INDEX+1))
	done
	mv ./Config.xml /eTablet/etc/launcher/Config.xml
}