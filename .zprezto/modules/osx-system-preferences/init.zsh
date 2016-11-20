function sysprefs() {
    paneName=$1

    if [[ -z "$paneName" ]]; then
        osascript <<EOF
            tell application "System Preferences"
                activate
            end tell
EOF
    else
        if [[ "$paneName" = "users" ]] \
                || [[ "$paneName" = "appstore" ]] \
                || [[ "$paneName" = "bluetooth" ]] \
                || [[ "$paneName" = "extensions" ]] \
                || [[ "$paneName" = "icloud" ]] \
                || [[ "$paneName" = "internetaccounts" ]] \
                || [[ "$paneName" = "parentalcontrols" ]] \
                || [[ "$paneName" = "configurationprofiles" ]] \
                || [[ "$paneName" = "sharing" ]]; then
            paneId="com.apple.preferences.$paneName"
        else
            paneId="com.apple.preference.$paneName"
        fi

        osascript <<EOF
            tell application "System Preferences"
                activate
                set the current pane to pane id "$paneId"
            end tell
EOF
    fi
}
