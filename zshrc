setopt extendedglob
zmodload -a colors
zmodload -a autocomplete
zmodload -a complist
autoload colors ; colors

export PATH="$PATH:$HOME/bin:$HOME/local/bin:$HOME/local/git/bin:$HOME/projects/tools/bin"

export PYTHONPATH="${HOME}/box/lib/python2.6/site-packages:${HOME}/local/lib/python2.6/site-packages:."
export PYTHONSTARTUP=~/.python_startup.py

setopt nocheckjobs

stty sane
stty dec ek
stty stop ""
stty start ""

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^J' history-beginning-search-forward-end
bindkey '^K' history-beginning-search-backward-end

export MPJ_LOCAL_VIM_GEOMETRY="150x120+200+20"


# I started with bash so I like having a $ sign in my prompt
set dollar = '$'
# PROMPT="%{\033[m%}[%{\033[33m%}%n%{\033[m%}@%{\033[33m%}%m%{\033[m%}~%{\033[33m%}%@%{\033[m%}:%c]$dollar "
orange="%{$fg[blue]%}"
# PROMPT="[%n@%M~%T:%c]$ "
PROMPT="%{$fg[white]%}[%{$fg[yellow]%}%n%{$fg[white]%}@%{$fg[yellow]%}%M%{$fg[white]%}~%{$fg[yellow]%}%T%{$fg[white]%}:%c]$ "

# Lines configured by zsh-newuser-install
HISTFILE=~/.zhistfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob
unsetopt notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mike/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export EDITOR="gvim -f"
export EXR_DISPLAY_VIDEO_GAMMA="2.2"

alias ls="ls --color=auto"
alias rm="rm -i"
alias ll='ls -alh'
alias lt='ls -althr'
alias du='du -h'
alias df='df -h'

alias spotify="padsp wine 'C:\\Spotify\spotify.exe' &"
alias rg="cd ~/projects"

alias c='jump; cd `cat /tmp/jump.tmp`'

# Development
# -----------
# alias gs='grep -I -R -n --colour=auto \!:* *'
gs() { grep -I -R -n --colour=auto $* * }
alias rej='find . -type f -name "*.rej"'

# Deviations
# ----------
alias gf="tr ':' ' ' | awk '{ print ${dollar}1 }' | no-repeats.py" 
alias timestamp="date +%Y%m%d%H%M%S"

# Non-specific
# ------------
alias ep='echo `pwd`/\!:1'
alias e='env | grep \!*'
alias m='make'
alias mc='make clean'

# Text editing
# ------------
alias g="$HOME/bin/gvim.py --server"
alias gg="$HOME/bin/gvim.py "
alias gt='opentree.tcsh'
alias vi='vim'
alias v='vim'

# Standard Applications
# ---------------------
alias mplayer='mplayer -ao alsa -loop 0'
alias mp='mplayer'
alias am="amarok; amarok"


