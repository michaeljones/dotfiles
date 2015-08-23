# setopt extendedglob

zmodload -a colors
zmodload -a autocomplete
zmodload -a complist

autoload -U colors && colors

# Assert emacs bindings for use in tmux
bindkey -e

#
#	Environment
#
export PYTHONSTARTUP=~/.python_startup.py

export EDITOR="gvim -f"
export EXR_DISPLAY_VIDEO_GAMMA="2.2"


# Fall back local geometry
if [[ ${+MPJ_LOCAL_VIM_GEOMETRY} -eq 0 ]] then
	export MPJ_LOCAL_VIM_GEOMETRY="150x120+200+20"
fi


#
#	Functions
#
gs() {
	# Use git grep inside git repositories. Use normal grep outside.
	in_git_dir=`git rev-parse --is-inside-work-tree 2> /dev/null`;
	if [ "$in_git_dir" = "true" ]; then
		git grep -n --color $* *;
	else
		grep -I -R -n --colour=auto $* *;
	fi;
}
gss() {
	# Use grep all the time (incase we want to normal grep inside a git repos)
	grep -I -R -n --colour=auto $* *;
}

ep() { echo `pwd`/$* }

e() { env | grep $* }

#
#   Hooks
#
command_not_found_handler() {
    if [ `echo $1 | cut -b1-3` = "git" ]
    then
        first=$1
        shift
        echo Autocorrecting to: git `echo $first | sed 's/git//'`$*
        git `echo $first | sed 's/git//'`$*
        return 0
    fi

    return 1
}



setopt nocheckjobs

stty sane
stty dec ek
stty stop ""
stty start ""

# bindkey -e

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^J' history-beginning-search-forward-end
bindkey '^K' history-beginning-search-backward-end

function virtualenv_prompt() {
    if [ -n "$VIRTUAL_ENV" ]; then
        echo "(${VIRTUAL_ENV##*/})"
    fi
}

# I started with bash so I like having a $ sign in my prompt
set dollar = '$'
# PROMPT="%{\033[m%}[%{\033[33m%}%n%{\033[m%}@%{\033[33m%}%m%{\033[m%}~%{\033[33m%}%@%{\033[m%}:%c]$dollar "
orange="%{$fg[blue]%}"
# PROMPT="[%n@%M~%T:%c]$ "
# PROMPT="$(virtualenv_prompt)%{$fg[white]%}[%{$fg[yellow]%}%n%{$fg[white]%}@%{$fg[yellow]%}%M%{$fg[white]%}~%{$fg[yellow]%}%T%{$fg[white]%}:%c]$ "
PROMPT="$(virtualenv_prompt)%{$fg_bold[white]%}[%{$fg[yellow]%}%n%{$fg[white]%}@%{$fg[yellow]%}%M%{$fg[white]%}~%{$fg[yellow]%}%T%{$fg[white]%}:%c]$ %{$reset_color%}"

eval `dircolors ~/.user_config/dircolors`

# Lines configured by zsh-newuser-install
HISTFILE=~/.zhistfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory extendedglob
setopt hist_ignore_space
unsetopt notify
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mike/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#

# Prevent zsh from asking "do you wish to see all N possibilities?" unless N > 9999
LISTMAX=9999


alias t="todo.sh"

alias ls="ls --color=auto"
alias rm="rm -i"
alias ll='ls -alh'
alias lt='ls -althr'
alias du='du -h'
alias df='df -h'


alias c='jump; cd `cat /tmp/jump.tmp`'

# Development
# -----------
# alias gs='grep -I -R -n --colour=auto \!:* *'
alias rej='find . -type f -name "*.rej"'

# Deviations
# ----------
alias gf="tr ':' ' ' | awk '{ print ${dollar}1 }' | no-repeats.py" 
alias timestamp="date +%Y%m%d%H%M%S"

# Non-specific
# ------------
alias m='make'
alias mc='make clean'

# Text editing
# ------------
alias g="$HOME/bin/gvim-wrapper --server"
alias gg="$HOME/bin/gvim-wrapper"
alias gt='opentree.tcsh'
alias vi='vim'
alias v='vim'

# Standard Applications
# ---------------------
alias mplayer='mplayer -ao alsa -loop 0'
alias mp='mplayer'
alias am="amarok; amarok"


# Git HEAD^ aliases
# -----------------
alias -g 'HEAD^'='"HEAD^"'
alias -g 'HEAD^^'='"HEAD^^"'
alias -g 'HEAD^^^'='"HEAD^^^"'
alias -g 'HEAD^^^^'='"HEAD^^^^"'
alias -g 'HEAD^^^^^'='"HEAD^^^^^"'
alias -g 'HEAD^^^^^^'='"HEAD^^^^^^"'
alias -g 'HEAD^^^^^^^'='"HEAD^^^^^^^"'
alias -g 'HEAD^^^^^^^^'='"HEAD^^^^^^^^"'
alias -g 'HEAD^^^^^^^^^'='"HEAD^^^^^^^^^"'
alias -g 'HEAD^^^^^^^^^^'='"HEAD^^^^^^^^^^"'
