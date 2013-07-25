HyperNote_AddLib "HyperNoteButtonBar 1.1                   by Hiperblade"
# --------------------------------------
# CONSTANT
# --------------------------------------
NONE="(none)"
LEFT="(left)"
HOME="(home)"
RIGHT="(right)"
EXIT="(exit)"
# --------------------------------------
CalculateButtonCoord()
{
	X1=$((97+(117*$1)))
	X2=$(($X1+107))
	X3=$(($X1+53))
}

ShowButton()
{
	CalculateButtonCoord $1
	fbecho -fillrect $X1,964,$X2,1024,255
	fbecho -rect $X1,987,$X2,1025,0
	#fbecho -fillrect $X1,987,$X1,1024,0
	#fbecho -fillrect $X1,987,$X2,987,0
	#fbecho -fillrect $X2,987,$X2,1024,0
	if [ "$2" != $NONE ]; then
		fbecho -centertext $X3,1008,0,"$2"
	fi
}

CalculateNavigationButtonColors()
{
	case $1 in
		"0") #disable
			color=200
			colorbk=255
			;;
		"1") #enable
			color=0
			colorbk=255
			;;
		"2") #pressed
			color=255
			colorbk=120
			;;
		*)
			color=255
			colorbk=255
			;;
	esac
}

ShowNavigationButtons()
{
	CalculateNavigationButtonColors $1

	fbecho -fillrect 8,980,88,1025,$colorbk

	fbecho -rect 8,980,88,1025,$color

	fbecho -line 31,999,43,987,$color
	fbecho -line 32,999,44,987,$color
	fbecho -line 33,999,45,987,$color
	fbecho -line 34,999,45,988,$color
	fbecho -line 35,999,46,988,$color
	fbecho -line 36,999,46,989,$color
	fbecho -line 37,999,46,990,$color

	fbecho -line 31,1000,65,1000,$color
	fbecho -line 30,1001,66,1001,$color
	fbecho -line 30,1002,66,1002,$color
	fbecho -line 30,1003,66,1003,$color
	fbecho -line 31,1004,65,1004,$color

	fbecho -line 31,1005,43,1017,$color
	fbecho -line 32,1005,44,1017,$color
	fbecho -line 33,1005,45,1017,$color
	fbecho -line 34,1005,45,1016,$color
	fbecho -line 35,1005,46,1016,$color
	fbecho -line 36,1005,46,1015,$color
	fbecho -line 37,1005,46,1014,$color

	CalculateNavigationButtonColors $2

	fbecho -fillrect 681,980,761,1025,$colorbk

	fbecho -rect 681,980,761,1025,$color

	fbecho -line 738,999,726,987,$color
	fbecho -line 737,999,725,987,$color
	fbecho -line 736,999,724,987,$color
	fbecho -line 735,999,724,988,$color
	fbecho -line 734,999,723,988,$color
	fbecho -line 733,999,723,989,$color
	fbecho -line 732,999,723,990,$color

	fbecho -line 738,1000,704,1000,$color
	fbecho -line 739,1001,703,1001,$color
	fbecho -line 739,1002,703,1002,$color
	fbecho -line 739,1003,703,1003,$color
	fbecho -line 738,1004,704,1004,$color

	fbecho -line 738,1005,726,1017,$color
	fbecho -line 737,1005,725,1017,$color
	fbecho -line 736,1005,724,1017,$color
	fbecho -line 735,1005,724,1016,$color
	fbecho -line 734,1005,723,1016,$color
	fbecho -line 733,1005,723,1015,$color
	fbecho -line 732,1005,723,1014,$color
}

HideHomeButton()
{
	fbecho -fillrect 373,964,395,982,255
}

ShowHomeButton()
{
# /\|
#/  \
#|  |
#|__|

# /
	fbecho -line 384,964,376,972,200
	fbecho -line 384,965,376,973,120
	fbecho -line 384,966,376,974,120
	fbecho -line 384,967,376,975,200
# \
	fbecho -line 384,964,392,972,200
	fbecho -line 384,965,392,973,120
	fbecho -line 384,966,392,974,120
# |
	fbecho -line 378,975,378,982,120
	fbecho -line 379,975,379,982,120
	#fbecho -line 380,975,380,980,200
# _
	fbecho -line 378,982,390,982,120
	fbecho -line 378,981,390,981,120
	#fbecho -line 380,980,388,980,200
#  |
	fbecho -line 390,966,390,982,120
	fbecho -line 389,966,389,982,120
#
	fbecho -line 389,975,389,973,255
	fbecho -line 390,975,390,974,255
	fbecho -line 384,967,392,975,200
}

ShowPressedButton()
{
	case $1 in
		5) #LEFT
			ShowNavigationButtons 2 $RIGHTBUTTON
			usleep 100000
			ShowNavigationButtons $LEFTBUTTON $RIGHTBUTTON
			;;
		6) #HOME
			ShowHomeButton
			usleep 500000
			HideHomeButton
			;;
		7) #RIGHT
			ShowNavigationButtons $LEFTBUTTON 2
			usleep 100000
			ShowNavigationButtons $LEFTBUTTON $RIGHTBUTTON
			;;
		*) #ABCDE
			CalculateButtonCoord $1

			fbecho -fillrect $X1,987,$X2,1024,120
			#fbecho -fillrect $X1,964,$X2,1024,120
			if [ "$2" != $NONE ]; then
				fbecho -centertext $X3,1008,255,"$2"
			fi
			usleep 100000
			fbecho -fillrect $X1,978,$X2,987,120
			usleep 100000
			fbecho -fillrect $X1,969,$X2,987,120
			usleep 50000
			fbecho -fillrect $X1,964,$X2,987,120
			usleep 250000

			ShowButton $1 $2
			;;
	esac
}

ReadKey()
{
	InKey=`dd if=/dev/input/event1 bs=16 count=1 | hexdump | grep '0000000' | cut -d' ' -f7 2>../log/error.log`
	case $InKey in
		"003b") #A
			CHOICEID=0
			CHOICE="$1"
			;;
		"003c") #B
			CHOICEID=1
			CHOICE="$2"
			;;
		"003d") #C
			CHOICEID=2
			CHOICE="$3"
			;;
		"003e") #D
			CHOICEID=3
			CHOICE="$4"
			;;
		"003f") #E
			CHOICEID=4
			CHOICE="$5"
			;;
		"0040") #Left
			if [ $6 = 1 ]; then
				CHOICEID=5
				CHOICE=$LEFT
			else
				CHOICEID=-1
				CHOICE=$NONE
			fi
			;;
		"0043") #Home
			if [ $7 = 1 ]; then
				CHOICEID=6
				CHOICE=$HOME
			else
				CHOICEID=-1
				CHOICE=$NONE
			fi
			;;
		"0058") #Right
			if [ $8 = 1 ]; then
				CHOICEID=7
				CHOICE=$RIGHT
			else
				CHOICEID=-1
				CHOICE=$NONE
			fi
			;;
		*)
			CHOICEID=-1
			CHOICE=$NONE
			;;
	esac
	if [ $CHOICE = $NONE ]; then
		ReadKey $1 $2 $3 $4 $5 $6 $7 $8
	fi
}

ShowButtons()
{
	#Menu Area and top bar
	ShowButton 0 $1
	ShowButton 1 $2
	ShowButton 2 $3
	ShowButton 3 $4
	ShowButton 4 $5
	case $6 in
		"LHR") #LHR
			LEFTBUTTON=1
			HOMEBUTTON=1
			RIGHTBUTTON=1
			;;
		"LH") #LH
			LEFTBUTTON=1
			HOMEBUTTON=1
			RIGHTBUTTON=0
			;;
		"LR") #LR
			LEFTBUTTON=1
			HOMEBUTTON=0
			RIGHTBUTTON=1
			;;
		"HR") #HR
			LEFTBUTTON=0
			HOMEBUTTON=1
			RIGHTBUTTON=1
			;;
		"L") #L
			LEFTBUTTON=1
			HOMEBUTTON=0
			RIGHTBUTTON=0
			;;
		"H") #H
			LEFTBUTTON=0
			HOMEBUTTON=1
			RIGHTBUTTON=0
			;;
		"R") #R
			LEFTBUTTON=0
			HOMEBUTTON=0
			RIGHTBUTTON=1
			;;
		*)
			LEFTBUTTON=0
			HOMEBUTTON=0
			RIGHTBUTTON=0
			;;
	esac
	ShowNavigationButtons $LEFTBUTTON $RIGHTBUTTON
	ReadKey $1 $2 $3 $4 $5 $LEFTBUTTON $HOMEBUTTON $RIGHTBUTTON
	ShowPressedButton $CHOICEID $CHOICE
}