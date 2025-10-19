# Check if the session is interactive
if status is-interactive
    # Set fish greeting to an empty string
    set -U fish_greeting ""

    # Initialize prompt and tools
    starship init fish | source
    zoxide init fish | source
    atuin init fish | source
    direnv hook fish | source

    # Source custom modules
    source ~/.config/fish/my_modules/pastes.fish

    # Environment variables
    set -x EDITOR /bin/nvim
    set -x CHARM_HOST "192.168.1.139"
    set -x PATH "$HOME/.local/bin" $PATH
    set -x PATH "$HOME/go/bin" $PATH
    set -x PATH "$HOME/.config/herd-lite/bin" $PATH
    set -x SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket

    # Node.js and Bun setup
    nvm use lts -s
    set --export BUN_INSTALL "$HOME/.bun"
    set --export PATH "$BUN_INSTALL/bin" $PATH

    # SSH aliases
    alias server "ssh root@192.168.1.139"
    alias pico "ssh pico.sh"
    alias texto "ssh texto-plano.xyz"
    alias xinu "ssh m1n@xinu.me"
    alias uber "ssh min@belinda.uberspace.de"

    # Development aliases
    alias vi nvim
    alias explain "gh copilot explain"
    alias suggest "gh copilot suggest"
    alias jj-push "jj git push -c @-"
    alias sudo sudo-rs
    alias update "paru -Syu"
    alias pa "hut paste"

    # Application aliases
    alias cls clear
    alias radio "cls; mpv https://radio.m1n.land --volume=60"
    alias note dnote

    # Fish configuration aliases
    alias fishconfig "nvim ~/.config/fish/config.fish"
    alias fishreload "source ~/.config/fish/config.fish"

    # Custom functions
    function ytdlp-bandcamp
        yt-dlp -o "%(artist)s/%(album)s/%(title)s.%(ext)s" $argv
    end

    function paru-remove
        paru -Rns $argv
    end

    function cdtmp
        set tmpdir (mktemp -d --suffix="-cdtmp")
        cd $tmpdir
    end

end

