cyan=%{$fg[cyan]%}
blue=%{$fg[blue]%}
red=%{$fg[red]%}
green=%{$fg[green]%}
white=%{$fg[white]%}

precmd() {
    PROMPT="${cyan}%n${white}@${blue}%m${red}%~ %{$reset_color%}$(git_super_status)
${white}> "
    RPROMPT="${green}%*%f"
}

source /home/steven/extras/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/steven/extras/zsh-history-substring-search/zsh-history-substring-search.zsh
source /home/steven/extras/zsh-git-prompt/zshrc.sh

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
unsetopt beep
bindkey -v
bindkey -s "\C-w" "cd ..\n"

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

alias ls="ls --color=auto"
alias la="ls -la --color=auto"
alias l="ls"
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias asd="cd .."

alias sag="sudo apt-get"
alias saguu="sag update; sag upgrade"

alias v="vim -p"
alias c="cd"
alias CD="cd"
alias vim="vim -p"
alias du="du -h"
alias df="df -h"

alias ga="git add"
alias gb="git branch"
alias gc="git commit -v"
alias gca="git commit --amend"
alias gd="git diff"
alias gdc="git diff --cached"
alias gcp="git cherry-pick"
alias gco="git checkout"
alias gp="git pull"
alias gl="git log"
alias gs="git status"
alias gh='git log --pretty=format:"%C(auto)%h %ad | %s%d %C(red)[%an]" --graph --date=short'

alias please="sudo"

export EDITOR=/usr/bin/vim

# custom funcs
cd() {
    builtin cd "$@";
    ls;

    # put directory in xterm title
    print -Pn "\e]2;%~\a"                                                                                                
}
