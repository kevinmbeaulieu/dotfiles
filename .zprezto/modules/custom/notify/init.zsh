function notify() {
    if [ $# -ge 1 ]
    then
        osascript -e "display notification \"$1\" with title \"Terminal\""
    else
        osascript -e "display notification \"Command finished.\" with title \"Terminal\""
    fi
}
