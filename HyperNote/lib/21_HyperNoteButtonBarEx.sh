HyperNote_AddLib "HyperNoteButtonBarEx 1.0                 by Hiperblade"
# ------------------------------------
# MENU
# ------------------------------------
PageNumber=0
PageMaxNumber=0
PageNavigation="H"

CalculatePageItems()
{
		# Navigation
		if [ $PageNumber = 0 ]; then
			PageNavigation="H"
		else
			PageNavigation="LH"
		fi
		if [ $PageNumber -lt $PageMaxNumber ]; then
			PageNavigation=$PageNavigation"R"
		fi
		# Item0
		ItemIndex=$((($PageNumber*5)+1))
		if [ $ItemIndex -le $ItemNumber ]; then
			eval Item0=\$$ItemIndex
		else
			Item0=$NONE
		fi
		# Item1
		ItemIndex=$(($ItemIndex+1))
		if [ $ItemIndex -le $ItemNumber ]; then
			eval Item1=\$$ItemIndex
		else
			Item1=$NONE
		fi
		# Item2
		ItemIndex=$(($ItemIndex+1))
		if [ $ItemIndex -le $ItemNumber ]; then
			eval Item2=\$$ItemIndex
		else
			Item2=$NONE
		fi
		# Item3
		ItemIndex=$(($ItemIndex+1))
		if [ $ItemIndex -le $ItemNumber ]; then
			eval Item3=\$$ItemIndex
		else
			Item3=$NONE
		fi
		# Item4
		ItemIndex=$(($ItemIndex+1))
		if [ $ItemIndex -le $ItemNumber ]; then
			eval Item4=\$$ItemIndex
		else
			Item4=$NONE
		fi
}

ShowButtonsPage()
{
	ItemNumber=$#
	PageMaxNumber=$((($ItemNumber-1)/5))
	CHOICE=$NONE
	while [ "$CHOICE" != $EXIT ]
	do
		CalculatePageItems "$@"
		ShowButtons "$Item0" "$Item1" "$Item2" "$Item3" "$Item4" $PageNavigation
		if [ "$CHOICE" = $HOME ]; then
			PageNumber=0;
			BUTTON_PAGE_CHOICE="$EXIT"
			CHOICE=$EXIT
		elif [ "$CHOICE" = $LEFT ]; then
			PageNumber=$(($PageNumber-1))
			CHOICE=$NONE
		elif [ "$CHOICE" = $RIGHT ]; then
			PageNumber=$(($PageNumber+1))
			CHOICE=$NONE
		elif [ "$CHOICE" != $NONE ]; then
			BUTTON_PAGE_CHOICE="$CHOICE"
			CHOICE=$EXIT
		else
			CHOICE=$NONE
		fi
	done
}

# ------------------------------------
# YesNo Menu ($RETURN_YESNO_CHOICE)
# ------------------------------------
YesNo()
{
	RETURN_YESNO_CHOICE=$NONE
	CHOICE=$NONE
	while [ "$CHOICE" != $EXIT ]
	do
		ShowButtons $NONE "YES" $NONE "NO" $NONE ""
		if [ "$CHOICE" = "NO" ]; then
			RETURN_YESNO_CHOICE="NO"
			CHOICE=$EXIT
		elif [ "$CHOICE" = "YES" ]; then
			RETURN_YESNO_CHOICE="YES"
			CHOICE=$EXIT
		else
			CHOICE=$NONE
		fi
	done
	CHOICE=$NONE
}