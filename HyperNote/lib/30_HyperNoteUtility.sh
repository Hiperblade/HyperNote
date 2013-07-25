HyperNote_AddLib "HyperNoteUtility 1.0                     by Hiperblade"
# ------------------------------------
# Utility
# ------------------------------------

# --------------------------------------
# Mount the filesystem as Read-Write
# --------------------------------------
MountFileSystem()
{
	/usr/local/eTablet/remount.sh 2>>../log/error.log
}

# ------------------------------------
# Screen 768x1024
# ------------------------------------
PaintBackground()
{
	fbecho -fillrect 0,0,768,1024,$1		#Background
}
PaintLogo()
{
	fbecho -fillrect 10,10,758,269,$1		#Logocd
}
PaintPage()
{
	fbecho -fillrect 10,279,758,954,$1	#Page
}
PaintToolBar()
{
	fbecho -fillrect 0,964,768,1024,$1	#ToolBar
}

# ------------------------------------
# Application
# ------------------------------------
# $1=name
# $2=path
# $3=action
# $4=icon
# $5=thumbnail
# $6=note
StartMenuApplicationAdd()
{
	ENTRY="<Ap thumbnail=\"icon\\/$5\" note=\"$6\" action=\"$3\" path=\"$2\" icon=\"icon\\/$4\" name=\"$1\"\\/>"
	eval "cat \/eTablet\/etc\/launcher\/Config.xml | sed -e 's/<\\/AppList>/    $ENTRY\n    <\\/AppList>/g' > \/eTablet\/etc\/launcher\/Config.xml 2>>..\/log\/error.log"
}

# $1=name
StartMenuApplicationRemove()
{
	eval "cat \/eTablet\/etc\/launcher\/Config.xml | sed -e '/name=\"$1\"/d' > \/eTablet\/etc\/launcher\/Config.xml 2>>..\/log\/error.log"
}

# ------------------------------------
# $1=TITLE
# $2=LOCATION
# $3=LEVEL=1
ApplicationConfigAdd()
{
	echo -ne "\nTITLE=$1\nLOCATION=$2/\nLEVEL=$3\nAPPEND\n" >> /eTablet/etc/server/.Aconfig 2>>../log/error.log
}

# $1=TITLE
ApplicationConfigRemove()
{
	eval "cat \/eTablet\/etc\/server\/.Aconfig | sed -e '/TITLE=$1/,/^$/d' > \/eTablet\/etc\/server\/.Aconfig 2>>..\/log\/error.log"
}

# ------------------------------------
# $1=filename (example: $SCRIPT_DIRECTORY/Data/icon_b_test.png )
IconAdd()
{
	ICONNAME=$(echo $1 | sed 's/\(.*\)\///g')
	cp -f "$1" "/usr/local/eTablet/bin/launcher/icon/$ICONNAME" 2>>../log/error.log
	chmod 644 "/usr/local/eTablet/bin/launcher/icon/$ICONNAME" 2>>../log/error.log
}

# $1=name (example: icon_b_test.png )
IconRemove()
{
	rm -f /usr/local/eTablet/bin/launcher/icon/$1 2>>../log/error.log
}