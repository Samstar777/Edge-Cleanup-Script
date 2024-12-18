# Edge-Cleanup-Script

## Overview

This script is designed to clean up older versions of Microsoft Edge on macOS devices, which may accumulate in the Edge Updater's directory. By retaining only the latest version, it helps ensure that vulnerability assessment tools like Qualys detect the correct version and reduces unnecessary storage usage.

## Features

- Automated Cleanup: Removes older versions of Edge from the specified directory.
- Dry-Run Mode: Simulates the cleanup process without deleting any files, for testing purposes.
- Detailed Logging: Logs all operations, including errors and successful deletions, to /var/log/edge_cleanup.log.
- Error Handling: Safely handles missing directories or permissions issues.

## Requirements

- macOS
- Administrative privileges (to run the script and access system directories)
- Bash (standard shell on macOS)

## Usage

### Clone the Repository

git clone https://github.com/yourusername/edge-cleanup-script.git
cd edge-cleanup-script

### Make the Script Executable
chmod +x cleanup_script.sh

### Run the Script
Dry-Run Mode: Simulate the cleanup process to see what would be removed without actually deleting anything
sudo DRY_RUN=true ./cleanup_script.sh

Full Cleanup: Execute the cleanup and remove older versions:
sudo ./cleanup_script.sh

## Logging

The script logs all operations to /var/log/edge_cleanup.log. Example log entries:

![alt text](https://github.com/Samstar777/Edge-Cleanup-Script/blob/main/Logging%20Screenshot.png)


## Customization

- Dry-Run Mode: Set DRY_RUN to true or false in the script.
- Log File Location: Update the LOG_FILE variable in the script to change the log file location.
- Edge Updater Path: Modify the EDGE_UPDATER_PATH variable to specify a different directory, if needed.

## Known Limitations

- This script does not update Microsoft Edge; it only cleans up older versions.
- Requires administrative privileges to execute.

## Contributing

Contributions are welcome! If you have improvements or suggestions, please open a pull request or an issue.

## License

This project is licensed under the MIT License. See the LICENSE file for details.
