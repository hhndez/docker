#!/bin/bash
export DISPLAY=:0.0
GIT_REPO=ssh://ehuhern@gerrit.ericsson.se:29418/DCOM/KPIs
PATH=.:$PATH:/usr/local/bin:/usr/bin/X11
BUILD_DIR=~/temp/buildKPIs
WORKSPACE=~/temp/KPIs2
TEMP_DIR=/home/ehuhern/Work/shells/temp
ICON_TEMP=/home/ehuhern/Work/shells/data/_icons.less
ICON_FILE=$WORKSPACE/dcomlib/src/dcomlib/icons/_icons.less
TEMPAPPS="dcomlib,dcomcorelib,dcomwidgetlib,dashboard"
echo "Build dir"
echo $BUILD_DIR
