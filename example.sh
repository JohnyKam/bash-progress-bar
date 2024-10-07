#!/bin/bash

source progress-bar.sh

# Example usage
for i in {1..50}; do
    fill_to_half_with_space "Progress value: $i"
    progress_bar_color "$i" 50 "92m"
    sleep 0.1
done

echo
