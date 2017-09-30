
set fish_greeting ""

alias g "n"
alias gs "grep -I -R -n --colour=auto $argv *"
alias ll "ls -alh"
alias lt "ls -althr"

# set PATH /home/mike/local/neovim/bin:/home/mike/.cabal/bin:/home/mike/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games

set --export PATH /home/mike/.cabal/bin $PATH

set --export VIRTUAL_ENV_DISABLE_PROMPT "true"

set --export DOTSHELL ".fish"

set --export LS_COLORS "ow=01;34;40:"


function rm
    command rm -i $argv
end


function gs
    if [ -z "$argv" ]
        echo "usage: gs <team>"
        return
    end

    # Use git grep inside git repositories. Use normal grep outside.
    set -l in_git_dir (git rev-parse --is-inside-work-tree ^ /dev/null)
    if [ "$in_git_dir" = "true" ]
        git grep -n --color $argv *
    else
        grep -I -R -n --colour=auto $argv *
    end
end
