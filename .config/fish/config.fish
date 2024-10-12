# Check if the session is interactive
if status is-interactive
    # Set fish greeting to an empty string
    set -U fish_greeting ""

    # Initialize starship prompt
    starship init fish | source

    # Aliases
    alias server "ssh root@192.168.1.139"
    alias cls "clear"
    alias vi "nvim"
    alias pa "pastol"
    alias explain "gh copilot explain"
    alias suggest "gh copilot suggest"
    alias pico "ssh -L 1337:localhost:80 -N pico-ui@pgs.sh"
    alias update "paru -Syu"

    # Fish related aliases
    alias fishconfig "nvim ~/.config/fish/config.fish"
    alias fishreload "source ~/.config/fish/config.fish"

    # Initialize various tools
    zoxide init fish | source
    atuin init fish | source
    direnv hook fish | source

    # Environment variables
    set -x EDITOR "/bin/nvim"
    set -x CHARM_HOST "192.168.1.139"
    set -x PATH "$HOME/.local/bin" $PATH

    # Use Node.js LTS version with nvm
    nvm use lts -s

    # Bun setup
    set --export BUN_INSTALL "$HOME/.bun"
    set --export PATH "$BUN_INSTALL/bin" $PATH

    # DNF5 completion
    complete -c dnf5 -n "__fish_seen_subcommand_from install" -xa "(__dnf5_list_available_packages) (__fish_complete_suffix .rpm)"
end
