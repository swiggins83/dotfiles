fg_black=%{$'\e[0;30m'%}
fg_red=%{$'\e[0;31m'%}
fg_green=%{$'\e[0;32m'%}
fg_brown=%{$'\e[0;33m'%}
fg_blue=%{$'\e[0;34m'%}
fg_purple=%{$'\e[0;35m'%}
fg_cyan=%{$'\e[0;36m'%}
fg_lgray=%{$'\e[0;37m'%}
fg_dgray=%{$'\e[1;30m'%}
fg_lred=%{$'\e[1;31m'%}
fg_lgreen=%{$'\e[1;32m'%}
fg_yellow=%{$'\e[1;33m'%}
fg_lblue=%{$'\e[1;34m'%}
fg_pink=%{$'\e[1;35m'%}
fg_lcyan=%{$'\e[1;36m'%}
fg_white=%{$'\e[1;37m'%}
#Text Background Colors
bg_red=%{$'\e[0;41m'%}
bg_green=%{$'\e[0;42m'%}
bg_brown=%{$'\e[0;43m'%}
bg_blue=%{$'\e[0;44m'%}
bg_purple=%{$'\e[0;45m'%}
bg_cyan=%{$'\e[0;46m'%}
bg_gray=%{$'\e[0;47m'%}
#Attributes
at_normal=%{$'\e[0m'%}
at_bold=%{$'\e[1m'%}
at_italics=%{$'\e[3m'%}
at_underl=%{$'\e[4m'%}
at_blink=%{$'\e[5m'%}
at_outline=%{$'\e[6m'%}
at_reverse=%{$'\e[7m'%}
at_nondisp=%{$'\e[8m'%}
at_strike=%{$'\e[9m'%}
at_boldoff=%{$'\e[22m'%}
at_italicsoff=%{$'\e[23m'%}
at_underloff=%{$'\e[24m'%}
at_blinkoff=%{$'\e[25m'%}
at_reverseoff=%{$'\e[27m'%}
at_strikeoff=%{$'\e[29m'%}

precmd() {

	setopt CORRECT 

	PROMPT="${fg_lred}%n@%m${fg_pink}%~ $(git_super_status)
${fg_white}> ${at_normal}"
	RPROMPT="${fg_dgray}"
}

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
unsetopt beep
bindkey -v

alias ls="ls --color=auto"
alias l="ls"
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias asd="cd .."
alias vi="vim"

alias :q="exit"

alias dropbox="~/.dropbox-dist/dropboxd start"

alias rainbowize="~/extras/Python/rainbowize"

cd() {
	builtin cd "$@";
	ls;

	print -Pn "\e]2;%~\a"
}

export M2_HOME=/opt/maven
export M2=$M2_HOME/bin
export PATH=$M2:$PATH
export JAVA_HOME=/opt/jdk1.7.0_25
export PATH=$JAVA_HOME/bin:$PATH
export ANT_HOME=/opt/ant
export PATH=$ANT_HOME/bin:$PATH
export TOMCAT_HOME=/opt/tomcat
export PATH=$TOMCAT_HOME:$PATH
export JAVA_OPTS="-server -XX:MaxPermSize=512m -Xms1024m -Xmx1024m"

export ANDROID_HOME=/home/steven/android/sdk
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH

#export GOPATH=/home/steven/Dropbox/development/go/game
export GOROOT=/opt/go
export PATH=$GOROOT/bin:$PATH

export UPORTAL_HOME=/home/steven/uPortal/uPortal
export U=/home/steven/uPortal/uPortal

export EDITOR=/usr/bin/vim

fpath=(/home/steven/extras/zsh-completions/src/$fpath)
source /home/steven/extras/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/steven/extras/zsh-history-substring-search/zsh-history-substring-search.zsh

source /home/steven/extras/zsh-git-prompt/zshrc.sh


function yank {
	touch ~/.clipboard
	for i in "$@"; do
		if [[ $i != /* ]]; then i=$PWD/$i; fi
		i=${i//\\/\\\\}; i=${i//$'\n'/$'\\\n'}
		printf '%s\n' "$i"
	done >> ~/.clipboard
}

function put {
	while IFS= read src; do
		cp -Rdp "$src" .
	done < ~/.clipboard
	rm ~/.clipboard
}
