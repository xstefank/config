#!/bin/bash

# Prevents the script from killing itself
pidof -o %PPID -x "$(basename "$0")" | xargs kill -9 2>/dev/null

WATCH_DIR="$HOME/Downloads"
IMPORT_DIR="/tmp/gcalcli-ics-imports"
mkdir -p "$IMPORT_DIR"
LAST_FILE=""
LAST_TIME=0

# Listen for events
inotifywait -m "$WATCH_DIR" -e close_write -e moved_to --format '%f' | while read FILE
do
    if [[ "$FILE" == *.ics ]]; then
        CURRENT_TIME=$(date +%s)
        
        # DEBOUNCE LOGIC:
        # If the filename is the same AND it's been less than 3 seconds, skip.
        if [[ "$FILE" == "$LAST_FILE" ]] && [ $((CURRENT_TIME - LAST_TIME)) -lt 3 ]; then
            continue
        fi

        # Update tracking variables
        LAST_FILE="$FILE"
        LAST_TIME=$CURRENT_TIME

        # Run the import
        if gcalcli import --calendar "- xstefank122@gmail.com" --reminder "10 popup" --reminder "30 popup" "$WATCH_DIR/$FILE"; then
            mv "$WATCH_DIR/$FILE" "$IMPORT_DIR/"
            notify-send "Calendar" "Imported $FILE"
        else
            notify-send "Calendar" "Failed to import $FILE"
        fi
    fi
done

