#!/bin/bash

# Edge Cleanup Script
# Created by Samstar777
# GitHub: https://github.com/Samstar777

# Variables
EDGE_UPDATER_PATH="/Library/Application Support/Microsoft/EdgeUpdater/apps/msedge-stable"
LOG_FILE="/var/log/edge_cleanup.log"
DRY_RUN=false   # Set to true to simulate the cleanup without deleting anything

# Functions
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

cleanup_versions() {
    log_message "Starting Edge cleanup process..."

    if [[ ! -d "$EDGE_UPDATER_PATH" ]]; then
        log_message "Error: Path $EDGE_UPDATER_PATH does not exist."
        exit 1
    fi

    # Identify the latest version
    LATEST_VERSION=$(ls "$EDGE_UPDATER_PATH" | sort -V | tail -n 1)
    log_message "Latest version identified: $LATEST_VERSION"

    # Loop through all versions and delete older ones
    for version in "$EDGE_UPDATER_PATH"/*; do
        version_name=$(basename "$version")

        if [[ "$version_name" != "$LATEST_VERSION" ]]; then
            if [[ "$DRY_RUN" == true ]]; then
                log_message "DRY-RUN: Would remove older version: $version_name"
            else
                log_message "Removing older version: $version_name"
                rm -rf "$version" && log_message "Successfully removed $version_name" || log_message "Failed to remove $version_name"
            fi
        else
            log_message "Skipping latest version: $version_name"
        fi
    done

    log_message "Edge cleanup process completed."
}

# Script Execution
log_message "==========================================="
log_message "Edge Cleanup Script Initiated"
log_message "Dry Run Mode: $DRY_RUN"

cleanup_versions

log_message "==========================================="
