# $$$$        $$$$  $$$$        $$$$  $$$$$$$$$$$$$$    $$$$$$$$$$$$$$$$  $$$$$$$$$$$$$$   
# $$$$        $$$$  $$$$        $$$$  $$$$$$$$$$$$$$$$  $$$$$$$$$$$$$$$$  $$$$$$$$$$$$$$$$ 
#                                                                                          
# $$$$$$$$$$$$$$$$    $$$$$$$$$$$$    $$$$$$$$$$$$$$$$  $$$$$$$$$$$$$$$$  $$$$$$$$$$$$$$$$ 
# $$$$$$$$$$$$$$$$      $$$$$$$$      $$$$$$$$$$$$$$    $$$$$$$$$$$$$$$$  $$$$$$$$$$$$$$   
# $$$$        $$$$        $$$$        $$$$              $$$$              $$$$      $$$$   
# $$$$        $$$$        $$$$        $$$$              $$$$$$$$$$$$$$$$  $$$$        $$$$ 
# $$$$        $$$$        $$$$        $$$$              $$$$$$$$$$$$$$$$  $$$$        $$$$ 
#                                                                                          
#   $$$$$$    $$$$    $$$$$$$$$$$$    $$$$$$$$$$$$$$$$  $$$$$$$$$$$$$$$$                   
# $$$$$$$$$$  $$$$  $$$$$$$$$$$$$$$$  $$$$$$$$$$$$$$$$  $$$$$$$$$$$$$$$$                   
#                                                                                          
# $$$$  $$$$  $$$$  $$$$        $$$$        $$$$        $$$$$$$$$$$$$$$$                   
# $$$$  $$$$  $$$$  $$$$        $$$$        $$$$        $$$$$$$$$$$$$$$$                   
# $$$$  $$$$  $$$$  $$$$        $$$$        $$$$        $$$$                               
# $$$$  $$$$$$$$$$  $$$$$$$$$$$$$$$$        $$$$        $$$$$$$$$$$$$$$$     Hiperblade    
# $$$$    $$$$$$      $$$$$$$$$$$$          $$$$        $$$$$$$$$$$$$$$$        2011       

# ------------------------------------
# Load LIB
# ------------------------------------
LIB_COUNT=0
LIB_DESCRIPTIONS=""

HyperNote_AddLib()
{
	eval LIB_DESCRIPTIONS_$LIB_COUNT="\$1"
	LIB_COUNT=$(($LIB_COUNT+1))
}

HyperNote_LoadLib()
{
	INDEX=1
	while [ $INDEX -le $# ]
	do
		eval LIB_FILE="./lib/\$$INDEX"
		eval . $LIB_FILE
		INDEX=$(($INDEX+1))
	done
}

HyperNote_LoadLib $(ls ./lib)

# ------------------------------------
# Load Partial file
# ------------------------------------
. ./HyperNoteMenuManager.sh
. ./HyperNotePackageManager.sh

# ------------------------------------
# HyperNote
# ------------------------------------
ShowLogo()
{
	ConsoleWriteLineAt  20 " \$\$\$\$        \$\$\$\$  \$\$\$\$        \$\$\$\$  \$\$\$\$\$\$\$\$\$\$\$\$\$\$    \$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$  \$\$\$\$\$\$\$\$\$\$\$\$\$\$   " 0
	ConsoleWriteLineAt  35 " \$\$\$\$        \$\$\$\$  \$\$\$\$        \$\$\$\$  \$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$  \$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$  \$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$ " 0
	ConsoleWriteLineAt  50 "                                                                                          " 0
	ConsoleWriteLineAt  65 " \$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$    \$\$\$\$\$\$\$\$\$\$\$\$    \$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$  \$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$  \$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$ " 0
	ConsoleWriteLineAt  80 " \$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$      \$\$\$\$\$\$\$\$      \$\$\$\$\$\$\$\$\$\$\$\$\$\$    \$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$  \$\$\$\$\$\$\$\$\$\$\$\$\$\$   " 0
	ConsoleWriteLineAt  95 " \$\$\$\$        \$\$\$\$        \$\$\$\$        \$\$\$\$              \$\$\$\$              \$\$\$\$      \$\$\$\$   " 0
	ConsoleWriteLineAt 110 " \$\$\$\$        \$\$\$\$        \$\$\$\$        \$\$\$\$              \$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$  \$\$\$\$        \$\$\$\$ " 0
	ConsoleWriteLineAt 125 " \$\$\$\$        \$\$\$\$        \$\$\$\$        \$\$\$\$              \$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$  \$\$\$\$        \$\$\$\$ " 0
	ConsoleWriteLineAt 140 "                                                                                          " 0
	ConsoleWriteLineAt 155 "   \$\$\$\$\$\$    \$\$\$\$    \$\$\$\$\$\$\$\$\$\$\$\$    \$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$  \$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$                   " 80
	ConsoleWriteLineAt 170 " \$\$\$\$\$\$\$\$\$\$  \$\$\$\$  \$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$  \$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$  \$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$                   " 80
	ConsoleWriteLineAt 185 "                                                                                          " 80
	ConsoleWriteLineAt 200 " \$\$\$\$  \$\$\$\$  \$\$\$\$  \$\$\$\$        \$\$\$\$        \$\$\$\$        \$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$                   " 80
	ConsoleWriteLineAt 215 " \$\$\$\$  \$\$\$\$  \$\$\$\$  \$\$\$\$        \$\$\$\$        \$\$\$\$        \$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$                   " 80
	ConsoleWriteLineAt 230 " \$\$\$\$  \$\$\$\$  \$\$\$\$  \$\$\$\$        \$\$\$\$        \$\$\$\$        \$\$\$\$                               " 80
	ConsoleWriteLineAt 245 " \$\$\$\$  \$\$\$\$\$\$\$\$\$\$  \$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$        \$\$\$\$        \$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$     Hiperblade    " 80
	ConsoleWriteLineAt 260 " \$\$\$\$    \$\$\$\$\$\$      \$\$\$\$\$\$\$\$\$\$\$\$          \$\$\$\$        \$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$        2011       " 80
}

ShowInfo()
{
	ConsoleConfigure 16 $CONSOLE_MAX_ROW
	PrintPageTitle "HyperNote 1.1" "by Hiperblade"

	ConsoleWriteLine 5 "This script are ispired by FullInstall created by pbarrette"
	ConsoleWriteLine 6 "You can find update at: http://dl.dropbox.com/u/20555332/HyperNote/HyperNote.html"

	ConsoleWriteLine 8 "For safety make a bakup of your device before use this script"
	ConsoleWriteLine 9 "I do not accept responsibility for any type"
	ConsoleWriteLine 10 "of direct or indirect damage caused by the use of this script"

	ConsoleWriteLine 15 "Libraries loaded                                      "

	INDEX=0
	while [ $INDEX -lt $LIB_COUNT ]
	do
		eval LibInfo=\$LIB_DESCRIPTIONS_$INDEX
		ConsoleAppendLine "   $LibInfo"
		INDEX=$(($INDEX+1))
	done
}

# ------------------------------------
# Exit Menu ($RETURN_EXIT_CHOICE)
# ------------------------------------
MainMenu_Exit()
{
	RETURN_EXIT_CHOICE=$NONE
	CHOICE=$NONE
	while [ "$CHOICE" != $EXIT ]
	do
		if [ -e "../dvt_check.txt" ]; then
			ShowButtons "RESTART" "YES" $NONE "NO" $NONE ""
		else
			ShowButtons $NONE "YES" $NONE "NO" $NONE ""
		fi
		
		if [ "$CHOICE" = "NO" ]; then
			RETURN_EXIT_CHOICE="NO"
			CHOICE=$EXIT
		elif [ "$CHOICE" = "YES" ]; then
			RETURN_EXIT_CHOICE="YES"
			CHOICE=$EXIT
		elif [ "$CHOICE" = "RESTART" ]; then
			mv ../dvt_check.txt ../dvt_check
			CHOICE=$NONE
		else
			CHOICE=$NONE
		fi
	done
	CHOICE=$NONE
}

MainMenu()
{
	ShowInfo
	CHOICE=$NONE
	while [ "$CHOICE" != $EXIT ]
	do
		if [ -e "./utilities/utilities.sh" ]; then
			ShowButtons "EXIT" $NONE "UTILITIES" "MENU'" "PACKAGE" ""
		else
			ShowButtons "EXIT" $NONE $NONE "MENU'" "PACKAGE" ""
		fi

		if [ "$CHOICE" = "EXIT" ]; then
			MainMenu_Exit
			if [ "$RETURN_EXIT_CHOICE" = "YES" ]; then
				CHOICE=$EXIT
			else
				CHOICE=$NONE
			fi
		elif [ "$CHOICE" = "PACKAGE" ]; then
			PackageManager
			ShowInfo
			CHOICE=$NONE
		elif [ "$CHOICE" = "MENU'" ]; then
			StartMenuManager
			ShowInfo
			CHOICE=$NONE
		elif [ "$CHOICE" = "UTILITIES" ]; then
			. "./utilities/utilities.sh" 2>>../log/error.log
			ShowInfo
			CHOICE=$NONE
		else
			CHOICE=$NONE
		fi
	done
}

# ------------------------------------
# Initialization
# ------------------------------------
MountFileSystem
ROOT_DIRECTORY="/mnt/extsdcard/HyperNote/"
PaintBackground 255
ConsoleClear
ShowLogo

# ------------------------------------
# Start main menu
# ------------------------------------
MainMenu

# ------------------------------------
# Reboot
# ------------------------------------
mount -o remount,ro /dev/mss/blk0p5 /usr
PaintPage 255
PaintToolBar 255
ConsoleWriteLineAt 500 "Booting EeeNote..." 0