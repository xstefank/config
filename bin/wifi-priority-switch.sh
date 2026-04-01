#!/bin/bash

# --- CONFIGURATION ---
# List your SSIDs in order of priority (Highest priority first)
PREFERRED_SSIDS=("StefiWiFi" "ThisIsNotTheWiFiYouReLookingFor")

# 1. Rescan to see what's currently in range (Takes a few seconds)
nmcli dev wifi rescan > /dev/null 2>&1

# 2. Identify the SSID we are currently using
# Corrected field: 'active' is valid when querying 'dev wifi'
CURRENT_SSID=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d':' -f2)

# 3. Get a list of all currently visible SSIDs
AVAILABLE_SSIDS=$(nmcli -t -f ssid dev wifi)

# 4. Iterate through your list.
for SSID in "${PREFERRED_SSIDS[@]}"; do
    # Check if a preferred SSID is in the 'available' list
    if echo "$AVAILABLE_SSIDS" | grep -qx "$SSID"; then
        
        # If the best available is already active, stay put
        if [ "$SSID" = "$CURRENT_SSID" ]; then
            echo "Already on the best available network: $SSID"
            exit 0
        fi
        
        # If a better network is found, switch to it
        echo "Higher priority network '$SSID' found. Switching..."
        nmcli connection up id "$SSID"
        exit 0
    fi
done

