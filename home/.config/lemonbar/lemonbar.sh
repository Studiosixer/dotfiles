#!/usr/bin/bash

# Define the clock
Clock() {
        DATETIME=$(date "+%a %b %d, %T")

        echo -n "$DATETIME"
}

#Define the battery
Battery() {
        BATPERC=$(acpi --battery | cut -d, -f2)
        echo "\uf240 $BATPERC"
}

PanelVolume()
{
        #volStatus=$(amixer get Master | tail -n 1 | cut -d '[' -f 4 | sed 's/].*//g')
        #volLevel=$(amixer get Master | tail -n 1 | cut -d '[' -f 2 | sed 's/%.*//g')
        volStatus=$(pactl list | grep "Sink #0" -A 15 |  grep "Mute: "| awk '{print($2)}')
	volLevel=$(pactl list | grep "Sink #0" -A 15 | grep "^\sVolume: " | awk '{print($5)}')
        # is alsa muted or not muted?
        if [ "$volStatus" == "yes" ]
        then
                echo "%{F#FF0000} \uf026 $volLevel %{F-}"
        else
                # If it is muted, make the font red
                echo "%{F#FFFFFF} \uf028 $volLevel %{F-}"
        fi
}

CurrentDesktop()
{
	cur=$(xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}')
	tot=$(xprop -root _NET_NUMBER_OF_DESKTOPS | awk '{print $3}')
	# Desktop numbers start at 0. if you want desktop 2 to be in second place,
	# start counting from 1 instead of 0. But wou'll lose a group ;)
	for w in $(seq 0 $((cur - 1))); do line="${line}\uf1db"; done

	# enough =, let's print the current desktop
	line="${line}\uf111"

	# En then the other groups
	for w in `seq $((cur + 2)) $tot`; do line="${line}\uf1db"; done

	# don't forget to print that line!
	echo -e $line
}

while true; do
	echo -e "%{l} $(CurrentDesktop)%{c}%{F#FFFFFF} $(Clock) | $(Battery) | $(PanelVolume) %{F-}%{B-}"
        sleep 0.25
done
