#!/bin/bash

# Start the stopwatch
start_time=$(date +%s)
echo "Stopwatch started. Type 'stop' and press Enter to stop it."

# Loop until the user types "stop"
while true; do
    read -r input
    if [ "$input" == "stop" ]; then
        break
    fi
done

# Stop the stopwatch
end_time=$(date +%s)
elapsed_time=$((end_time - start_time))

# Display the elapsed time
echo "Elapsed time: $elapsed_time seconds"
