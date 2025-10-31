#!/bin/bash
battery_capacity=$(cat /sys/class/power_supply/BAT0/capacity)
charging_status=$(cat /sys/class/power_supply/ADP1/online)

if [ "$battery_capacity" -lt 10 ] && [ "$charging_status" -eq 0 ]; then
	if [ ! -f /tmp/battery_10_notified ]; then
	  notify-send -u critical -i battery-caution "Battery low" "Battery less than 10 percent"
	  touch /tmp/battery_10_notified
	fi
elif [ "$battery_capacity" -lt 20 ] && [ "$charging_status" -eq 0 ]; then
	if [ ! -f /tmp/battery_20_notified ]; then
		notify-send -i battery-low "Battery low" "Battery less than 20 percent"
      touch /tmp/battery_20_notified
   fi
elif [ "$battery_capacity" -eq 100 ] && [ "$charging_status" -eq 1 ]; then
	if [ ! -f /tmp/battery_full_notified ]; then
		notify-send -i battery-full "Battery charged" "Battery fully charged (100%)"
		touch /tmp/battery_full_notified
	fi
else
    rm -f /tmp/battery_10_notified /tmp/battery_20_notified /tmp/battery_full_notified
fi
