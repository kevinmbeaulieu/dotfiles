# If not running interactively, don't do anything.
#
# Any commands that should be run on non-interactive
# shells too should be placed above this line.
case $- in
    *i*) ;;
      *) return;;
esac


# ------------------------
# -  ZSH PLUGINS/THEMES  -
# ------------------------

# Set zsh custom directory
if [ -z "$ZSH_CUSTOM" ]; then
    ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
fi

# Enable antigen, oh-my-zsh
source $(brew --prefix)/share/antigen/antigen.zsh
antigen use oh-my-zsh

# Plugins to load
antigen bundles <<EOBUNDLES
    bgnotify
    colored-man-pages
    command-not-found
    git
    git-extras
    osx
    zsh-users/zsh-autosuggestions
    zsh-users/zsh-syntax-highlighting

    $ZSH_CUSTOM/plugins/fuzzy-open-file
    $ZSH_CUSTOM/plugins/google-browser
    $ZSH_CUSTOM/plugins/open-app-or-website
    $ZSH_CUSTOM/plugins/osx-system-preferences
    $ZSH_CUSTOM/plugins/quit
    $ZSH_CUSTOM/plugins/wolfram-alpha
EOBUNDLES

# Load the plugins
antigen apply

# Set prompt: <current directory name>[<git branch>]$ 
PROMPT='$FG[021]%c$FG[000]$(git_prompt_info)$FG[006]$ %{$reset_color%}'
ZSH_THEME_GIT_PROMPT_PREFIX='['
ZSH_THEME_GIT_PROMPT_SUFFIX=''
ZSH_THEME_GIT_PROMPT_DIRTY='*]'
ZSH_THEME_GIT_PROMPT_CLEAN=']'

# Set zsh-autosuggestions color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=246'


# ---------------------------
# -  SET VARIOUS VARIABLES  -
# ---------------------------

# Hyphen-insensitive completion
HYPHEN_INSENSITIVE="true"

# Command auto-correction
ENABLE_CORRECTION="true"

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Set colors for ls command
LSCOLORS=exfxcxdxbxegedabagacad

# Set gopath
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

# Set colors for zsh autocompletion
zstyle ':completion:*' list-colors 'di=34:ln=35:so=32:pi=33:\
    ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" \
    && source "${HOME}/.iterm2_shell_integration.zsh"


# -------------------------
# -       FUNCTIONS       -
# -------------------------

# Empty downloads folder
function empty-downloads() {
    mv $HOME/Downloads/* $HOME/.Trash
}

# Make directory then cd into it
function mkd() {
    mkdir -p "$@" && cd "$_"
}


# --------------------------
# -  KEY BINDINGS/ALIASES  -
# --------------------------

# --- clear ---
alias c='clear'

# --- killall typos ---
alias kilall='killall'

# --- ls ---
alias l='ls -CF' # default
alias ls='ls -CF' # default
alias la='ls -AF' # show hidden files
alias ll='ls -AlF' # show hidden files, long format

# --- todoist ---
alias todo='todoist-cli items' # cfdrake/todoist-cli

# --- homebrew  packages ---
alias gs='git status' # git
alias g='googler --colors ACegxy --count 8' # googler
eval $(thefuck --alias please) # thefuck
eval $(thefuck --alias fuck) # thefuck
alias empty-trash='trash -e' # trash
alias trash-empty='trash -e' # trash

# --- zsh built-in autocompletion ---
if [[ "${terminfo[kcbt]}" != "" ]]; then
    bindkey "${terminfo[kcbt]}" menu-complete # [shift-tab]
fi

# --- zsh plugins ---
alias q='quick-look' # osx
alias ql='quick-look' # osx
bindkey "^I" autosuggest-accept # zsh-autosuggestions [tab]

# --- custom zsh plugins ---
alias fof='fuzzy-open-file'
alias gui='google-browser'
alias o='open-app-or-website'

