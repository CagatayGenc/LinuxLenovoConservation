#!/bin/bash


CONSERVATION_FILE="/sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode"

if [ ! -f "$CONSERVATION_FILE" ]; then
    echo "Conservation mode file not found!"
    exit 1
fi

state=$(<"$CONSERVATION_FILE")

if [ "$state" == 0 ]; then
    if pkexec bash -c "echo 1 > $CONSERVATION_FILE"; then
        echo "Conservation mode ENABLED"
    else
        echo "Failed to enable conservation mode!"
        exit 1
    fi
elif [ "$state" == 1 ]; then
    if pkexec bash -c "echo 0 > $CONSERVATION_FILE"; then
        echo "Conservation mode DISABLED"
    else
        echo "Failed to disable conservation mode!"
        exit 1
    fi
else
    echo "Unsupported state: $state"
    exit 1
fi
