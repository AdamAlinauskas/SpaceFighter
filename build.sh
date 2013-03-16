mkdir -p bin

~/Documents/games/AIRSDK_COMPILER/bin/mxmlc -output bin/spaceshooter.swf -source-path flixel -- src/Main.as

if [ $? -eq 0 ]
	then 
	~/Documents/games/AIRSDK_COMPILER/bin/fdb bin/spaceshooter.swf
fi
