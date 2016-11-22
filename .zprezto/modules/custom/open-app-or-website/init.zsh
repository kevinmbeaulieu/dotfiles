function open-app-or-website() {
    if [[ $# < 1 ]]; then
        export VERSIONER_PERL_PREFER_32_BIT=yes
        defaultbrowser=$(perl -MMac::InternetConfig -le "print +(GetICHelper \"http\")[1]")
        open -a $defaultbrowser
        export VERSIONER_PERL_PREFER_32_BIT=no
    else
        arg=$1
        if [ -d "/Applications/$arg.app" ]; then
            # Application with that name exists
            echo "Opening $arg"
            open -a $arg
        else
            if [[ "$arg" != http* ]]; then
                arg="https://$arg"
            fi
            if [[ "$arg" != *.com* && "$arg" != *.edu* && "$arg" != *.org* && "$arg" != *.gov* ]]; then
                arg="$arg.com"
            fi
            echo "$arg"
            open "$arg"
        fi
    fi
}
