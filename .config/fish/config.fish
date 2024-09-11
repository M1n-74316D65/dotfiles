if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -U fish_greeting ""
starship init fish | source

# aliases
alias server "ssh root@192.168.1.139"

alias cls clear
alias vi nvim
alias pa pastol
alias pa pastol
alias explain 'gh copilot explain'
alias suggest 'gh copilot suggest'
alias pico 'ssh -L 1337:localhost:80 -N pico-ui@pgs.sh'

# fish related
alias fishconfig 'nvim ~/.config/fish/config.fish'
alias fishreload 'source ~/.config/fish/config.fish'

zoxide init fish | source
atuin init fish | source

set -x EDITOR /bin/nvim
set -x CHARM_HOST "192.168.1.139"
set -x PATH $HOME/.local/bin $PATH

nvm use lts -s

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
