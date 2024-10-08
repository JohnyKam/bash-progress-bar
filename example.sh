#!/bin/bash

source progress-bar.sh

# Set the total number of steps
total_steps=20

# Loop through the steps and update the progress bar
for ((step=1; step<=total_steps; step++))
do
     # Perform some task
     sleep 0.1
     printf "Step: $step/$total_steps "

     # Update the progress bar
     progress_bar $step $total_steps
done
echo


# Set the total number of steps
total_steps=25

# Loop through the steps and update the progress bar
for ((step=1; step<=total_steps; step++))
do
    # Perform some task
    sleep 0.1
    # Show info
    fill_to_half_with_space "Progress bar on right side, step: $step/$total_steps"

    # Update the progress bar
    progress_bar $step $total_steps

done
echo

total_steps=20
# Example usage
for ((step=1; step<=total_steps; step++))
do
    fill_to_half_with_space "Progress bar (with color), step: $step/$total_steps"
    progress_bar_color $step $total_steps $Green
    sleep 0.1
done
echo
