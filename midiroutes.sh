#!/bin/sh
# this is still only a working example which connects my Oxygen 49 to my edrum kit with a 10$ USB/MIDI converter
/usr/bin/aconnect -io | /usr/bin/awk '
BEGIN {
	con = 0;
	a = 0;
	b = 0;
}
/^client\ /{
	if(index($0, "USB Midi")) {
		b = substr($2, 0, length($2)-1);
	}
	if(index($0, "Oxygen 49")) {
		a = substr($2, 0, length($2)-1);
	}
}
END {
	if(a && b) {
		print("aconnect " a " " b);
		system("/usr/bin/aconnect " a " " b);
	} else {
		print("client missing, not connected");
	}
}'
