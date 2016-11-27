function __fuzzy-open-directory-usage() {
    echo "Usage: fuzzy-open-directory [-h] [-o] [-p <path>] query"
    echo
    echo "Help: Search for, and open files from a shell."
    echo "\tChanges current working directory to specified directory."
    echo "Options:"
    echo "\t-h, --help\tPrint this help message and exit."
    echo "\t-o\t\tOpen directory in Finder."
    echo "\t-p, --path\tSearch only within the specified path (default: ~)."
}

function __fuzzy-open-directory-unset-vars() {
    unset fod_no_such_directory_error
    unset fod_path
    unset fod_query
    unset fod_filepath
    unset fod_open_finder
}

function fuzzy-open-directory() {
    fod_no_such_directory_error="No matching directories found."

    # Process arguments
    fod_path=$HOME
    fod_open_finder=false
    while test $# != 0
    do
        case "$1" in
        -h|--help)
            __fuzzy-open-directory-usage
            __fuzzy-open-directory-unset-vars
            return 0 ;;
        -o)
            fod_open_finder=true ;;
        -p|--path)
            shift
            fof_path=$1 ;;
        *)
            fod_query=$1 ;;
        esac
        shift
    done

    if [[ -z $fod_query ]]; then
        __fuzzy-open-directory-usage
        __fuzzy-open-directory-unset-vars
        return 0
    fi

    # Search for exact substring
    fod_filepath=$(mdfind -onlyin $fod_path "kMDItemContentType == public.folder && kMDItemDisplayName == '*$fod_query*'c" \
        | grep -v $HOME/Library \
        | head -1)

    # Fuzzy search
    if [[ -z $fod_filepath ]]; then
        fod_query="*$(echo "$fod_query" | sed 's/./&\*/g')" # query => *q*u*e*r*y*

        fod_filepath=$(mdfind -onlyin $fod_path "kMDItemContentType == public.folder && kMDItemDisplayName == '$fod_query'c" \
            | grep -v $HOME/Library \
            | head -1)

        if [[ -z $fod_filepath ]]; then
            # No matching file
            echo $fod_no_such_directory_error
            __fuzzy-open-directory-unset-vars
            return 0
        fi
    fi

    # Open file
    if [[ "$fod_open_finder" = true ]]; then
        echo "Opening $fod_filepath"
        open "$fod_filepath"
    else
        echo "Opening $fod_filepath"
        cd "$fod_filepath"
    fi

    __fuzzy-open-directory-unset-vars
}
