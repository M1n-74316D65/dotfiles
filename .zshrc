# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# -----------------
# Zim configuration
# -----------------

# Use degit instead of git as the default tool to install and update modules.
#zstyle ':zim:zmodule' use 'degit'

# --------------------
# Module configuration
# --------------------

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# ------------------
# Initialize modules
# ------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
    if (( ${+commands[curl]} )); then
        curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
    else
        mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
    fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
    source ${ZIM_HOME}/zimfw.zsh init -q
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

zmodload -F zsh/terminfo +p:terminfo
# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
for key ('k') bindkey -M vicmd ${key} history-substring-search-up
for key ('j') bindkey -M vicmd ${key} history-substring-search-down
unset key
# }}} End configuration added by Zim install

autoload -Uz compinit

eval "$(starship init zsh)"

# pastes.sh
function uppaste {
    if [[ "$1" == "help" ]]; then
        echo "Doesnt expires"
    else
        cat "$1" | ssh pastes.sh "$1" expires=false
    fi
}

function uppast {
    if [[ "$1" == "help" ]]; then
        echo "Expires in 90 days"
    else
        cat "$1" | ssh pastes.sh "$1"
    fi
}

function uppasteh {
    if [[ "$1" == "help" ]]; then
        echo "Its hidden"
    else
        cat "$1" | ssh pastes.sh "$1" expires=false hidden=true
    fi
}

function uppasth {
    if [[ "$1" == "help" ]]; then
        echo "expires in 90 days and is hidden"
    else
        cat "$1" | ssh pastes.sh "$1" hidden=true
    fi
}

function downpaste {
    if [[ "$1" == "help" ]]; then
        echo "download pastes"
    else
        rsync pastes.sh:/"$1" .
    fi
}

function listpastes {
    sftp -b - pastes.sh << EOF
ls
EOF
}

#

alias server="ssh root@192.168.1.139"
alias pico="ssh -L 1337:localhost:80 -N pico-ui@pgs.sh"
alias nixos-config="z ~/.config/nix-config"
alias update-nixos="nh os switch ~/.config/nix-config"
alias update-flake="nix flake update"

alias cls="clear"
alias vi="lvim"
alias nvim="lvim"
alias pa="pastol"
alias explain='gh copilot explain'
alias suggest='gh copilot suggest'

eval "$(zoxide init zsh)"

export EDITOR=/bin/nvim
export CHARM_HOST="192.168.1.139"
export OPENAI_API_KEY=$(skate get mods-gpt-api)
export api_omg_lol=$(skate get api_omg.lol)
export PATH="$HOME/.local/bin:$PATH"

eval "$(atuin init zsh)"

# bun completions
[ -s "/home/m1n/.bun/_bun" ] && source "/home/m1n/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
