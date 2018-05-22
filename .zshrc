source /home/ggis/extras/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/ggis/extras/zsh-history-substring-search/zsh-history-substring-search.zsh
source /home/ggis/extras/zsh-git-prompt/zshrc.sh
source /home/ggis/extras/z/z.sh


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

# fuzzy autocomplete
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'

setopt auto_cd

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
alias rmrf="rm -rf"

alias sag="sudo apt-get"
alias saguu="sag update; sag upgrade"

alias v="vim -p"
alias c="cd"
alias CD="cd"
alias cd..="cd .."
alias vim="vim -p"
alias du="du -h"
alias df="df -h"

alias g="gulp"
alias gs="gulp serve"
alias ge="gulp eslint"
alias gp="gulp polylint"

alias m="mvn"
alias mc="m clean"
alias mi="mc install"
alias mp="mc package"
alias msb="m spring-boot:run"
alias mr="mp; cd service; msb; cd -"
alias mt="m test"
alias ni="npm i"
alias bi="npm run-script bower-install"
alias gg="ni && bi && gs"

alias ga="git add"
alias gb="git branch"
alias gc="git commit -v"
alias gca="git commit --amend"
alias gd="git diff"
alias gf="git fetch"
alias gdc="git diff --cached"
alias gcp="git cherry-pick"
alias gco="git checkout"
alias gcod="git checkout develop"
alias gpu="git pull"
alias gpod="gpu origin develop"
alias gpo="git push origin"
alias gl="git log -n5"
alias gt="git status"
alias gh='git log --pretty=format:"%C(auto)%h %ad | %s%d %C(red)[%an]" --graph --date=short'
alias gr="git revert"

alias port="sudo netstat -nlp | grep"

alias please="sudo"

alias zz="source ~/.zshrc"

# custom funcs
cd() {
    builtin cd "$@";
    ls;
}

export EDITOR=/usr/bin/vim

export KAFKA_HOME=/home/ggis/programs/kafka
export PATH=$PATH:$KAFKA_HOME/bin

alias cdb="cd /home/ggis/development/git/cdb-id-driver-rating/"
alias lib="cd /home/ggis/development/git/lib-messaging/"
