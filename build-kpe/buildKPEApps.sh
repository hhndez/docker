#!/bin/bash
export TERM=xterm
BUILD_DIR=~/buildKPE/
WORKSPACE=~/KPIs
TEMP_DIR=~/temp
ICON_TEMP=~/_icons.less
ICON_FILE=$WORKSPACE/dcomlib/src/dcomlib/icons/_icons.less
TEMPAPPS="dcomlib,dcomcorelib,dcomwidgetlib,dashboard"
APPS=(aaa accounts dcomadmin resetpassword o2f o2fgordon compadmin compmgmt competence)
echo $?
asset() {
  expected=$1
  received=$2
  message=$3
  if [ $expected -ne $received ]; then
	echo $message
	exit 1;
  fi
}

clear

rm -fR $BUILD_DIR

#If workspace dir does not exists, it creates a new one and clone the repository.
#if [ ! -e $WORKSPACE ]; then
#	echo "Creating workspace..."
#	mkdir $WORKSPACE
	cd $WORKSPACE/dashboard
	pwd
	count=1
	for app in ${APPS[@]}
        do
		linkApp="$WORKSPACE/$app"
		echo "---------------------------------------------------------------"	
		echo "Creating link... $linkApp ($count of ${#APPS[@]})"
		echo "---------------------------------------------------------------"	
		cdt2 package link $linkApp
		asset 0 $? "Error creating link"
		count=$((count + 1))
	done
#else
#	echo "Workpace already exists"
#fi

cd $WORKSPACE/dashboard
cdt2 package list > $TEMP_DIR/list.txt
echo "Checking that every app is included in package list..."
for app in ${APPS[@]}
do
	app=`echo "${app,,}"`
	fgrep "$app -->" $TEMP_DIR/list.txt 	
	asset 0 $? "Does not exists $app in dashboard app"
done

echo "Check-updates"
count=1
for app in ${APPS[@]}
do
	echo "-------------------------------------------"	
	echo "App $app ($count of ${#APPS[@]})"
	echo "-------------------------------------------"	
	cd $WORKSPACE/$app
	cdt2 package install
	asset 0 $? "Package install $app"
	cdt2 package check-updates
	asset 0 $? "Package check-updates $app"
	cdt2 package install tablelib
	asset 0 $? "Package install $app"
	cdt2 package install chartlib
	asset 0 $? "Package install $app"
	count=$((count + 1))
done

echo "Replacing icon file"
cp $ICON_TEMP $ICON_FILE
asset 0 $? "Error copy file"

echo "Executing build"
cd $WORKSPACE
for app in ${APPS[@]}
do
   	#app=`echo "${app,,}"`
   	TEMPAPPS="$TEMPAPPS,$app"
done
echo "TEMPAPPS = $TEMPAPPS"

set -x

cdt2 build --use-external-phantomjs --packages $TEMPAPPS --deploy $BUILD_DIR > /home/hhndez/output.txt && tail -f /home/hhndez/output.txt
asset 0 $? "Build failed"

#echo "Removing temporary icon file"
#git checkout -- $ICON_FILE
#git checkout -- $RADAR_FILE
#asset 0 $? "Checkout -- failed"
#notify-send "DONE"
echo "CDT2 Build done"
