function usage() {
    echo "Usage: quit <application-name> <application-name> ..."
    echo "Quits all specified applications."
}

function quit() {
    if [ $# = 0 ]; then
        usage
        return
    fi

    while test $# != 0
    do
        case "$1" in
        -h|--help) usage; return ;;
        *) osascript -e "quit app \"$1\"" ;;
        esac
        shift
    done
}
