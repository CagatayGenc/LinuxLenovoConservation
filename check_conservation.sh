#!/bin/bash

CONSERVATION_FILE="/sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode"

if [ ! -f "$CONSERVATION_FILE" ]; then
    echo "Conservation mode file not found!"
    exit 1
fi

state=$(<"$CONSERVATION_FILE")

if [ "$state" == 1 ]; then
    echo "ENABLED"
elif [ "$state" == 0 ]; then
    echo "DISABLED"
else
    echo "UNKNOWN"
fi
