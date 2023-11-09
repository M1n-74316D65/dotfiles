if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -U fish_greeting ""
starship init fish | source
source ~/.config/op/plugins.sh

alias cls clear


# aliases
alias server "ssh root@192.168.1.139"

alias vi nvim

# fish related
alias fishconfig 'nvim ~/.config/fish/config.fish'
alias fishreload 'source ~/.config/fish/config.fish'

# exa
alias ls 'eza -lh --git --icons --group-directories-first --color=always'
alias lsa 'eza -lh --git --icons --group-directories-first --color=always --all'

# fzf
# fzf fuzzy file search and open with default editor
function ffo
    set selected_file (fzf --preview 'bat --style=numbers --color=always {}' --preview-window=up:60%:wrap)
    if test -n "$selected_file"
        $EDITOR $selected_file
    end
end

# fzf fuzzy directory search and cd into selected directory
function fcd
    set selected_dir (find . -type d 2> /dev/null | fzf)
    if test -n "$selected_dir"
        cd "$selected_dir"
    end
end

# fzf fuzzy search command history and execute selected command
function fhist
    set selected_cmd (history | fzf | awk '{print $2}')
    if test -n "$selected_cmd"
        eval $selected_cmd
    end
end

# fzf fuzzy search and kill selected process
function fkill
    set selected_pid (ps -ef | sed 1d | fzf -m | awk '{print $2}')
    if test -n "$selected_pid"
        kill -9 $selected_pid
    end
end

# fzf fuzzy search and cd into selected parent directory
function fup
    set selected_dir (find * -type d | fzf)
    if test -n "$selected_dir"
        cd ..
    end
end
