function google-browser() {
    local query=$1
    query=$(python -c "import sys, urllib as ul; \
        print ul.quote_plus(\"$1\")")
    open "https://www.google.com/search?q=$query"
}
