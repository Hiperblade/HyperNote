# ------------------------------------
# Utilities 1.0 by pbarrette
# ------------------------------------
Utilities_TelnetDeamon_Install()
{
	ConsoleAppendLine "Instal telnet deamon?"
	YesNo
	if [ "$RETURN_YESNO_CHOICE" = "YES" ]; then
		DIR="$SCRIPT_DIRECTORY/Data/telnet"
		echo "/usr/sbin/telnetd &" >> /usr/local/eTablet/run.sh 2>>../log/error.log
		cp -f $DIR /etc 2>>error.log
		cp -f $DIR /eTablet/etc/launcher/ 2>>../log/error.log
		ConsoleAppendLine "Istallation done!"
	fi
	Utilities_PrintState
}

Utilities_Language_IT()
{
	ConsoleAppendLine "Converting language to Italian?"
	YesNo
	if [ "$RETURN_YESNO_CHOICE" = "YES" ]; then
		FILE="$SCRIPT_DIRECTORY/languages/sys.config"
		FILE_GZ="$SCRIPT_DIRECTORY/languages/IT.tar.gz"
		sed -e 's/^default=...$/default=it/;s/^default=..$/default=it/' /eTablet/etc/setting/sys.config > $FILE 2>>../log/error.log
		cp -f $FILE /eTablet/etc/setting/ 2>>../log/error.log
		rm -f $FILE 2>>../log/error.log
		cp $FILE_GZ /usr/local/eTablet/ 2>>../log/error.log
		chown root:root /usr/local/eTablet/IT.tar.gz 2>>../log/error.log
		tar -xzf /usr/local/eTablet/IT.tar.gz -C/usr/local/eTablet/ 2>>../log/error.log
		rm /usr/local/eTablet/IT.tar.gz 2>>../log/error.log
		ConsoleAppendLine "Istallation done!"
	fi
	Utilities_PrintState
}

Utilities_Language_EN()
{
	ConsoleAppendLine "Converting language to English?"
	YesNo
	if [ "$RETURN_YESNO_CHOICE" = "YES" ]; then
		FILE="$SCRIPT_DIRECTORY/Data/sys.config"
		sed -e 's/^default=...$/default=en/;s/^default=..$/default=en/' /eTablet/etc/setting/sys.config > $FILE 2>>../log/error.log
		cp -f $FILE /eTablet/etc/setting/ 2>>../log/error.log
		rm -f $FILE 2>>../log/error.log
		mv /usr/local/eTablet/bin/browser/translations/etablet_zh.qm /usr/local/eTablet/bin/browser/translations/etablet_zh.qm_ 2>>../log/error.log
		mv /usr/local/eTablet/bin/browser/translations/etablet_zh.ts /usr/local/eTablet/bin/browser/translations/etablet_zh.ts_ 2>>../log/error.log
		ConsoleAppendLine "Istallation done!"
	fi
	Utilities_PrintState
}

Utilities_RemovePassword()
{
	ConsoleAppendLine "Remove the password?"
	YesNo
	if [ "$RETURN_YESNO_CHOICE" = "YES" ]; then
		rm -f /eTablet/etc/login/.key 2>>../log/error.log
		sed -e 's/=0/=1/' /eTablet/etc/login/security.config > "$SCRIPT_DIRECTORY/security.config" 2>>../log/error.log
		mv -f "$SCRIPT_DIRECTORY/security.config" /eTablet/etc/login/ 2>>../log/error.log

		sed -e 's/=0/=1/' /eTablet/etc/login.conf > "$SCRIPT_DIRECTORY/login.conf" 2>>../log/error.log
		mv -f "$SCRIPT_DIRECTORY/login.conf" /eTablet/etc/ 2>>../log/error.log
		ConsoleAppendLine "Password Removed!"
	fi
	Utilities_PrintState
}

Utilities_PrintPage()
{
	ConsoleConfigure 16 $CONSOLE_MAX_ROW
	PrintPageTitle "Utilities 1.1" "by pbarrette"
	ConsoleWriteLine 5 "Collection of utilities"
	ConsoleWriteLine 6 "Telnet deamon"
	ConsoleWriteLine 7 "Language English and Italian"
	ConsoleWriteLine 8 "Remove Password"

	ConsoleWriteLine 10 "(Use the arrows to navigate and the Home button to go back)"

	ConsoleWriteLine 15 "-= LOG =-"

	Utilities_PrintState
}

Utilities_PrintState()
{
	ConsoleClearLine 12
	#TODO
	#ConsoleWriteLine 12 "The current language is: unknown (not implemented)"
}

# ------------------------------------
# START
# ------------------------------------
Utilities_PrintPage
CHOICE=$NONE
while [ "$CHOICE" != $EXIT ]
do
	ShowButtonsPage "TELNET" "LanguageEN" "LanguageIT" "RM-Password"
	#ShowButtonsPage "TELNET" "LanguageEN" "LanguageIT" "RM-Password" "more" "more" "more" "more" ...

	if [ "$BUTTON_PAGE_CHOICE" = $EXIT ]; then
		CHOICE=$EXIT
	elif [ "$BUTTON_PAGE_CHOICE" = "TELNET" ]; then
		Utilities_TelnetDeamon_Install
		CHOICE=$NONE
	elif [ "$BUTTON_PAGE_CHOICE" = "LanguageEN" ]; then
		Utilities_Language_EN
		CHOICE=$NONE
	elif [ "$BUTTON_PAGE_CHOICE" = "LanguageIT" ]; then
		Utilities_Language_IT
		CHOICE=$NONE
	elif [ "$BUTTON_PAGE_CHOICE" = "RM-Password" ]; then	
		Utilities_RemovePassword
		CHOICE=$NONE
	else
		CHOICE=$NONE
	fi
done
BUTTON_PAGE_CHOICE=$NONE