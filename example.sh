#!/bin/bash

source progress-bar.sh

# Example usage
for i in {1..50}; do
    fill_to_half_with_space "Progress value: $i"
    progress_bar "$i" 50
    sleep 0.1
done

echo