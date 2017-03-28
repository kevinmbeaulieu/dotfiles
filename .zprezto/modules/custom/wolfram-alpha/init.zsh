function wolfram() {
    local appid=$(cat ~/.wolframappid)
    local format="plaintext"
    local query=$(python -c "import sys, urllib; print urllib.quote_plus(\"$1\")")
    local url="http://api.wolframalpha.com/v2/query?input=$query&appid=$appid&format=$format"

    echo "Retrieving..."

    local result_file=$(mktemp)
    curl -f -s $url -o $result_file

    local parsed_file=$(mktemp)
    xml2 < $result_file > $parsed_file

    local in_primary=false
    local in_unitconversion=false
    while read -r line; do
        if [[ $line =~ ^.*\/pod\/\@primary\=true$ ]]; then
            in_primary=true
        fi
        if [[ "$in_primary" = true && ! $line =~ ^.*\/pod.+$ ]]; then
            in_primary=false
        fi
        if [[ $line =~ ^.*\/pod\/\@id\=UnitConversion$ ]]; then
            in_unitconversion=true
        fi
        if [[ "$in_unitconversion" = true && ! $line =~ ^.*\/pod.+$ ]]; then
            in_unitconversion=false
        fi

        if [[ ("$in_primary" = true || "$in_unitconversion" = true) && $line =~ ^.*\/pod\/subpod\/plaintext\=.*$ ]]; then
            echo "$(echo $line | sed -n 's/^.*\/pod\/subpod\/plaintext\=\(.*\)$/\1/p')"
        fi
    done < $parsed_file
}
