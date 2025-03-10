#!/bin/bash
# A simple wrapper for curl with logging functionality

# Create logs directory if it doesn't exist
LOGS_DIR="/Users/jaidhyani/Desktop/luthien/logs"
mkdir -p "$LOGS_DIR"

# Log file with date and time in the filename
LOG_FILE="$LOGS_DIR/safecurl_$(date +"%Y%m%d").log"

# Generate a unique request ID (using md5 on macOS)
REQUEST_ID=$(date +%s | md5 | head -c 8)

# Function to log messages
log_message() {
  echo "[$(date +'%Y-%m-%d %H:%M:%S')] [$REQUEST_ID] $1" >> "$LOG_FILE"
}

# Check if curl is available
if ! command -v curl &> /dev/null; then
  log_message "ERROR: curl command not found"
  echo "Error: curl command not found" >&2
  exit 1
fi

# Log the command with timestamp and request ID
log_message "REQUEST: curl $*"

# Execute the curl command with -w to get status code and timing info
response=$(curl -w "\n%{http_code}\n%{time_total}" -s "$@")
curl_exit_code=$?

# Check if curl command succeeded
if [ $curl_exit_code -ne 0 ]; then
  log_message "ERROR: curl command failed with exit code $curl_exit_code"
  echo "Error: curl command failed with exit code $curl_exit_code" >&2
  exit $curl_exit_code
fi

# Extract status code and timing from the response
status_code=$(echo "$response" | tail -n 2 | head -n 1)
time_total=$(echo "$response" | tail -n 1)
# More reliable way to remove the last two lines
output=$(echo "$response" | sed '$d' | sed '$d')

# Log the response status and timing
log_message "RESPONSE: Status $status_code, Time ${time_total}s"

# Echo just the output (without status code and timing)
echo "$output"