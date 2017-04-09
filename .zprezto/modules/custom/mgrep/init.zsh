# Spotlight metadata find and grep by Daniel.Hoherd at gmail dot com
function mgrep() {
    # Check for at least two arguments, print usage if else
    if [ $# -lt 1 ] ; then
        echo "Usage: $0 query [dir/file] ..."
        exit ;
    fi

    ss=$1;
    shift;
    files=$@;

    until [ -z "$1" ] ; do
        thisitem=$1
        onlyin="-onlyin '$thisitem' $onlyin"
        shift
    done;

    eval mdfind -0 $onlyin "$ss" | xargs -0 grep -Hi "$ss"
}
