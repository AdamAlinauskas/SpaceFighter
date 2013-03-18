mkdir -p bin

~/Documents/games/AIRSDK_COMPILER/bin/mxmlc -debug=true -output bin/spaceshooter.swf -source-path lib/flixel -- src/Main.as

if [ $? -eq 0 ]
	then 
	open bin/spaceshooter.swf
fi
