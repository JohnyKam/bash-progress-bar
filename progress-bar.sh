#!/bin/bash

# Colors
Black="30m"
Red="31m"
Green="32m"
Yellow="33m"
Blue="34m"
Magenta="35m"
Cyan="36m"
LightGray="37m"
Gray="90m"
LightRed="91m"
LightGreen="92m"
LightYellow="93m"
LightBlue="94m"
LightMagenta="95m"
LightCyan="96m"
White="97m"


# This function displays a progress bar in the terminal.
# Usage: progress_bar <current_step> <total_steps>
# Arguments:
#   current_step: The current step number (must be a positive integer).
#   total_steps: The total number of steps (must be a positive integer).
# Example:
#   progress_bar 3 10
# This will display a progress bar indicating that 3 out of 10 steps are completed.
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


# Displays a progress bar in the terminal.
# This function provides a visual representation of progress for long-running tasks.
# Usage:
#   progress_bar_info <current_step> <total_steps>
# Arguments:
#   current_step: The current step number (must be a positive integer).
#   total_steps: The total number of steps (must be a positive integer).
# Example:
#   progress_bar_info 3 10
# This will display a progress bar indicating that 3 out of 10 steps are completed.
progress_bar_info() {
    printf "\e[96m"
    progress_bar $1 $2
    printf "\e[0m"
}


# This function displays a progress bar with a specified color.
# The color can be customized by passing a color code as an argument.
# Usage: 
#   progress_bar_info <current_step> <total_steps> <color_code>
# Arguments:
#   current_step: The current step number (must be a positive integer).
#   total_steps: The total number of steps (must be a positive integer).
#   color_code: The color code to use for the progress bar.
# Example:
#   progress_bar_info 3 10 "92m"
# This will display a green progress bar indicating that 3 out of 10 steps are completed.
progress_bar_color() {
    local color=$3
    if [ -z "$3" ]; then
        color="97m"
    fi
    printf "\e[$color"
    progress_bar $1 $2
    printf "\e[0m"
}


#
# Function: fill_to_half_with_space
# Description: This function fills up to half of terminal line with spaces.
# Usage: 
#   fill_to_half_with_space <message>
# Arguments: 
#   message: The message to be displayed and filled with space.
fill_to_half_with_space() {
    local message=$1
    local columns=$(tput cols)
    local half=$((columns / 2))
    local message_length=${#message}
    printf "${message}"
    printf "%$((half - message_length))s"
}
