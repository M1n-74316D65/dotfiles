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
alias nvim lvim
alias pa pastol
alias explain 'gh copilot explain'
alias suggest 'gh copilot suggest'

# fish related
alias fishconfig 'nvim ~/.config/fish/config.fish'
alias fishreload 'source ~/.config/fish/config.fish'

zoxide init fish | source
atuin init fish | source
thefuck --alias fuck | source 

set -x EDITOR /bin/nvim
set -x CHARM_HOST "192.168.1.139"
set -x OPENAI_API_KEY (skate get mods-gpt-api)
set -x api_omg_lol (skate get api_omg.lol)
set -x PATH $HOME/.local/bin $PATH

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
