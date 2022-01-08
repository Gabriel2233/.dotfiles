#!/bin/sh

percentage=$(acpi -b | awk '{ print $4 }' | tr -d '%,')

[[ $percentage -lt 15 ]] && /usr/bin/notify-send -u "Low" "Battery" "Battey is low, only 15% remaining"
[[ $percentage -lt 10 ]] && /usr/bin/notify-send -u "Normal" "Battery" "Battey is low, only 10% remaining"
[[ $percentage -lt 5 ]] && /usr/bin/notify-send -u "Critical" "Battery" "Battey is low, only 5% remaining"
