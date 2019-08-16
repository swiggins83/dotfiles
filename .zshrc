. ~/.path-exports
. ~/.docker-creds
. ~/.kube-aliases

source /Users/stevenwiggins/extras/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /Users/stevenwiggins/extras/zsh-git-prompt/zshrc.sh
source /Users/stevenwiggins/extras/z/z.sh
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh

cyan=%{$fg[cyan]%}
blue=%{$fg[blue]%}
red=%{$fg[red]%}
green=%{$fg[green]%}
white=%{$fg[white]%}

precmd() {
    PROMPT="${cyan}%n${white}@${blue}%m${red}%~ %{$reset_color%}$(git_super_status)
${white}> "
    RPROMPT="${white}%*%f"
}

# bindkey '^[[A' up-line-or-search
# bindkey '^[[B' down-line-or-search

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

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

alias la="ls -la"
alias l="ls"
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

alias m="mvn"
alias mc="m clean"
alias mi="mc install"
alias mp="mc package"
alias msb="m spring-boot:run"
alias mr="mp; cd service; msb; cd -"
alias mt="m test"
alias ni="npm i"
alias nid="npm i -D"
alias y="yarn"
alias bi="npm run-script bower-install"
alias gg="ni && bi && gs"

alias ga="git add"
alias gb="git branch"
alias gc="git commit -v"
alias gca="git commit --amend"
alias gd="git diff"
alias gf="git fetch"
alias gdc="gd --cached"
alias gcp="git cherry-pick"
alias gco="git checkout"
alias gcod="gco develop"
alias gcom="gco master"
alias gpu="git pull"
alias gpom="gpu origin master"
alias gpod="gpu origin develop"
alias gpo="git push origin"
alias gl="git log -n5"
alias gt="git status"
alias gh='git log --pretty=format:"%C(auto)%h %ad | %s%d %C(red)[%an]" --graph --date=short'
alias gr="git revert"

alias top="top -u"

alias ls="gls --color=auto"

alias please="sudo"

alias zz="source ~/.zshrc"

alias ip="curl ipecho.net/plain ; echo"

alias de="docker exec"
alias dl="docker container ls"
alias ds="docker stop $(dl | awk -F ' ' '{print $1}' | sed -n 2p)"

# alias drm="$(docker image ls | awk -F ' ' '{print $3}' | awk 'NR>1') | while read line; do echo $line; docker rmi $line; done"

alias dc="docker-compose"
alias dcu="docker-compose up"
alias dcd="docker-compose down"

alias kc="kubectl"
alias kcgp="kc get pods"
alias kce="kc exec -it"
alias kci="kc cluster-info"
alias kca="kc apply -f"

alias w="watch -n2 -d kubectl get pods"

kced() {
    kubectl edit deploy "$1" && wd "$1"
}

wd() {
    watch -n2 -d kubectl get pods -l app="$1"
}

kcs() {
    kc scale --replicas $1 deploy/$2 &&
        wd $2
}

is_pod_ready() {
    [[ "$(kubectl get po -l app="$1" -o 'jsonpath={.status.conditions[?(@.type=="Ready")].status}')" == 'True' ]]
}

kcpod() {
    kcgp -l app="$1" | awk -F ' ' '{print $1}' | sed -n 2p
}

kcpodweb() {
    kcgp -l app="$1",type="web" | awk -F ' ' '{print $1}' | sed -n 2p
}

kclogpod() {
    kc logs $(kcpod "$1") -f
}

exec_onto() {
    kce -it $(kcpod "$1") /bin/bash
}

alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs"
alias emacsclient="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"

export EDITOR="/usr/bin/vim"
export EA_EDITOR='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -a "" -c'
export KUBE_EDITOR="/usr/bin/vim"
export VISUAL=$EDITOR
export ALTERNATE_EDITOR=""

# custom funcs
cd() {
    builtin cd "$@";
    ls;
}

port() {
    lsof -nP -i4TCP:"$1" | grep LISTEN;
}

..() {
    builtin cd ..;
    ls;
}


kubelocal

pokemonsay
