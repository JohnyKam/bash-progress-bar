#!/bin/bash

# Function to display a progress bar
progress_bar() {
    local width=50
    local percentage=$1
    local max=$2

    if [ -z "$2" ]; then
        max=100
    fi

    if [ "$percentage" -gt "$max" ]; then
        max=$percentage
    fi

    local filled=$((percentage * width / max))
    local empty=$((width - filled))

    printf "["
    printf "%${filled}s" | tr ' ' '#'
    printf "%${empty}s" | tr ' ' '-'
    printf "] %d%%\r" "$percentage"
}
