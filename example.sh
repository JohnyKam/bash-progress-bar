#!/bin/bash

source progress-bar.sh

# Example usage
for i in {1..100}; do
    progress_bar "$i" 50
    sleep 0.1
done
echo