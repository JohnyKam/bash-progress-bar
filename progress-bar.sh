#!/bin/bash

# Function to display a progress bar
progress_bar() {
    local columns=$(tput cols)
    local width=$((columns / 2))
    width=$((width - 7))
    local value=$1
    local max=$2

    if [ -z "$2" ]; then
        max=100
    fi

    if [ "$value" -gt "$max" ]; then
        max=$value
    fi
    local percentage=$((value * 100 / max))
    local filled=$((value * width / max))
    local empty=$((width - filled))

    printf "["
    printf "%${filled}s" | tr ' ' '#'
    printf "%${empty}s" | tr ' ' '-'
    printf "] %d%%\r" "$percentage"
}

progress_bar_info() {
    printf "\e[96m"
    progress_bar $1 $2
    printf "\e[0m"
}

progress_bar_color() {
   printf "\e[$3"
   progress_bar $1 $2
   printf "\e[0m"
}

# Function to fill the terminal with spaces
fill_to_half_with_space() {
    local message=$1
    local columns=$(tput cols)
    local half=$((columns / 2))
    local message_length=${#message}
    printf "${message}"
    printf "%$((half - message_length))s"
}
