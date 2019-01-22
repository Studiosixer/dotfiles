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


while true; do
	echo -e "%{c}%{F#FFFFFF}%{B#0000FF} $(Clock) | $(Battery) | $(PanelVolume) %{F-}%{B-}"
        sleep 1
done
