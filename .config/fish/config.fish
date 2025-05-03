# Check if the session is interactive
if status is-interactive
    # Set fish greeting to an empty string
    set -U fish_greeting ""

    # Initialize starship prompt
    starship init fish | source

    # Get pastes.sh commands
    source ~/.config/fish/my_modules/pastes.fish

    # Aliases
    alias server "ssh root@192.168.1.139"
    alias cls clear
    alias vi nvim
    alias pa pastol
    alias explain "gh copilot explain"
    alias suggest "gh copilot suggest"
    alias pico "ssh pico.sh"
    alias texto "ssh texto-plano.xyz -i ~/.ssh/texto-plano"
    alias update "paru -Syu"
    alias zola "flatpak run org.getzola.zola"
    alias pa "hut paste"
    alias radio "cls; mpv https://radio.m1n.land --volume=60"
    alias music ncmpcpp
    alias note dnote
    alias gopher ncgopher
    alias irc senpai

    # Fish related aliases
    alias fishconfig "nvim ~/.config/fish/config.fish"
    alias fishreload "source ~/.config/fish/config.fish"

    # Initialize various tools
    zoxide init fish | source
    atuin init fish | source
    direnv hook fish | source

    # Environment variables
    set -x EDITOR /bin/nvim
    set -x CHARM_HOST "192.168.1.139"
    set -x PATH "$HOME/.local/bin" $PATH
    set -x PATH "$HOME/go/bin" $PATH
    set -x SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket

    # Use Node.js LTS version with nvm
    nvm use lts -s

    # Bun setup
    set --export BUN_INSTALL "$HOME/.bun"
    set --export PATH "$BUN_INSTALL/bin" $PATH

    # Solo lanza Zellij si estamos en Ghostty
    # if test "$TERM" = xterm-ghostty
    # eval (zellij setup --generate-auto-start fish | string collect)
    # end

    function ytdlp-bandcamp
        yt-dlp -o "%(artist)s/%(album)s/%(title)s.%(ext)s" $argv
    end
end
