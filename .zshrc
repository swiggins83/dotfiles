# Colors
fg_cyan=%{$'\e[0;36m'%}
fg_lgray=%{$'\e[0;37m'%}
fg_dgray=%{$'\e[1;30m'%}
fg_lred=%{$'\e[1;31m'%}
fg_lblue=%{$'\e[1;34m'%}
fg_pink=%{$'\e[1;35m'%}
fg_white=%{$'\e[1;37m'%}
# Attributes
at_normal=%{$'\e[0m'%}

precmd() {

	setopt CORRECT

	PROMPT="${fg_cyan}%n@%m${fg_lred}%~ $(git_super_status)
${fg_white}> ${at_normal}"
	RPROMPT="${fg_dgray} $(spotify_control.py -d artist title album)"
}

chpwd() {
    bindkey -s "\C-b" "build $(basename $(pwd))\n"
}

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
unsetopt beep
bindkey -v

bindkey -s "\C-n" "clear; mvn clean package\n"

zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

alias ls="ls --color=auto"
alias la="ls -la --color=auto"
alias l="ls"
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias asd="cd .."

alias :q="exit"

alias stats="~/scripts/vim_git_status.sh"

alias initportal="~/scripts/initportal.sh"

alias dropbox="/home/steven/.dropbox-dist/dropboxd"

alias v="vim -p"
alias c="cd"
alias CD="cd"
alias vim="vim -p"
alias du="du -h"
alias df="df -h"

alias gco="git checkout"
alias glog="git log"
alias gs="git status"

export M2_HOME=/home/steven/programs/maven
export M2=$M2_HOME/bin
export PATH=$M2:$PATH
export JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk-amd64/
export PATH=$JAVA_HOME/bin:$PATH
export ANT_HOME=/home/steven/programs/ant
export PATH=$ANT_HOME/bin:$PATH
export TOMCAT_HOME=/home/steven/programs/tomcat
export PATH=$TOMCAT_HOME:$PATH
export JAVA_OPTS="-server -XX:MaxPermSize=512m -Xms1024m -Xmx2048m"
export GROOVY_HOME=/home/steven/programs/groovy
export PATH=$GROOVY_HOME/bin:$PATH
export GOROOT=/home/steven/programs/go
export PATH=$GOROOT/bin:$PATH
export GOPATH=/home/steven/Dropbox/development/go
export PATH=$GOPATH/bin:$PATH

export ANDROID_HOME=/home/steven/android/sdk
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH

export NODE_HOME=/home/steven/programs/node
export PATH=$NODE_HOME/bin:$PATH

export HSQLDB_HOME=/home/steven/programs/hsql
export PATH=$HSQLDB_HOME/bin:$PATH

export PATH=$PATH:/home/steven/extras/PySpotifyInfo

export PORTAL_HOME=/home/steven/uportal/uPortal
export UPORTAL_HOME=/home/steven/uportal/uportal_gitlab
export U=$PORTAL_HOME

export UMOBILE_HOME=/home/steven/uportal/umobile/umobile-app-phonegap/
export MO=$UMOBILE_HOME

export EDITOR=/usr/bin/vim

fpath=(/home/steven/extras/zsh-completions/src/$fpath)
source /home/steven/extras/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/steven/extras/zsh-history-substring-search/zsh-history-substring-search.zsh

source /home/steven/extras/zsh-git-prompt/zshrc.sh

source /home/steven/extras/PySpotifyInfo/spot_info.zsh

# custom funcs
cd() {
	builtin cd "$@";
	ls;

	# put directory in xterm title
	print -Pn "\e]2;%~\a"
}

rem() {
	mv "$@" ~/.trash
}

function build {
	builtin cd $U
	for arg in "$@"; do
		if [[ $arg == "uportal" ]]; then
			t stop &&
			groovy -Dbuild.portlets.skip=true build.groovy &&
			t start
		elif [[ $arg == "portlets" ]]; then
			t stop &&
			groovy -Dbuild.portal.skip=true build.groovy &&
			t start
		else
			groovy -Dbuild.target.portlet=$arg build.groovy &&
		fi
	done
	builtin cd -
}

# hsql
function h {
	./scripts/hsql-run.sh
}

# tomcat
function t {
	for i in "$@"; do
		if [[ $i == "start" ]]; then
			$TOMCAT_HOME/bin/startup.sh
		elif [[ $i == "stop" ]]; then
			kill -9 $(ps aux | grep 'tomcat' | awk '{print $2}')
			sleep 5
		elif [[ $i == "restart" ]]; then
			kill -9 $(ps aux | grep 'tomcat' | awk '{print $2}') &&
			sleep 10
			$TOMCAT_HOME/bin/startup.sh
		elif [[ $i == "s" || $i == "status" ]]; then
			ps aux | grep 'tomcat'
		else
			echo "whachu tryna do"
		fi
	done
}
