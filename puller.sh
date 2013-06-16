#!/bin/bash

#purpose:
#  This tiny program helps linux user to improt photos from their android phone
#	For one photo i recommend using the direct command line
#	but for a serial range of photos to import at one command this will do good


#application to import files from xperia s(Android 4.1)
echo "***************************ADB Image Transfer Client********************************";
echo "*******Please give the pathname where you want to store the files*******************";
echo "Enter the path name(absolute only):\c";
read storepath;
#checking if the direcory exists or not

if [ ! -d $storepath ]
then
	echo "please enter a valid directory path";
	exit 1;
fi

#end of direcory check
#if the directory fails then the adb will paste the files where this file is resting on your machine
	

echo "enter the starting point:\c";
read point1;

echo "enter the last point :\c";
read point2;

#create a path for adb: /opt/android-sdk-linux/platform-tools/
PATH=$PATH:/opt/android-sdk-linux/platform-tools/

#now get files from adb using location: pathname where to import files
while `test $point1 -lt $point2`	#starting point should be smaller than the end point 
do
	point1=`expr $point1 + 1`;
        filename="DSC_$point1"; 
	echo "the file currently copying iis $filename:";
	location="$storpath";
	pathname="/mnt/sdcard/DCIM/100ANDRO/DSC_$point1.jpg $1$filename";
	`adb pull $pathname` 
done;


#use this and improve it as per your wish

#things to remmber while setting it up
#	check the adb directory and put it what is appropritae for you at line 33
#	check the location of your photos address via the file explorer in your phone and put that directory in
# 	line 42
#	your done good luck
