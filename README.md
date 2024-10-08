# Bash Progress Bar

This repository contains a Bash script that implements a progress bar for command line interfaces.

## Installation

To use the progress bar script, follow these steps:

1. Clone the repository:

    ```bash
    git clone https://github.com/janek/bash-progress-bar.git
    ```

2. Change into the repository directory:

    ```bash
    cd bash-progress-bar
    ```


## Usage

The progress bar script can be used in any Bash script or command line application that requires a visual representation of progress. Simply include the `progress_bar.sh` file in your project and call the `progress_bar` function with the appropriate parameters.

Here's an simple example usage:

```bash
source progress_bar.sh

# Set the total number of steps
total_steps=10

# Loop through the steps and update the progress bar
for ((step=1; step<=total_steps; step++))
do
     # Perform some task
     sleep 0.1

     # Update the progress bar
     progress_bar $step $total_steps
done
echo
```

### Progress bar from second half of terminal

To display the progress bar from the second half of the terminal, you can use the `fill_to_half_with_space` function. This script demonstrates how to position the progress bar in the right half of the terminal window:

```bash
#!/bin/bash

source progress_bar.sh

# Set the total number of steps
total_steps=10

# Loop through the steps and update the progress bar
for ((step=1; step<=total_steps; step++))
do
     # Perform some task
     sleep 0.1
     # Show info
     fill_to_half_with_space "Step: $step"

     # Update the progress bar
     progress_bar $step $total_steps
done
echo
```

This script will display the progress bar starting from the middle of the terminal, providing a clear visual indication of progress.

### Progress bar from second half of terminal with color

To display the progress bar from the second half of the terminal with color, you can use the `progress_bar_color` function. This script demonstrates how to position the progress bar in the right half of the terminal window and add color to it:

```bash
#!/bin/bash

source progress_bar.sh

# Set the total number of steps
total_steps=10

# Loop through the steps and update the progress bar
for ((step=1; step<=total_steps; step++))
do
    fill_to_half_with_space "Progress bar (with color), step: $step/$total_steps"
    progress_bar_color $step $total_steps $Green
    sleep 0.1
done
```

## Contributing

Contributions are welcome! If you have any ideas, suggestions, or bug reports, please open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.
