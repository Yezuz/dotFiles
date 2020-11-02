#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

#PS1='[\u@\h \W]\$ '
PS1='\e[1;32m[\u@\h:\w]\$\e[0m '

export PATH=~/.dotnet/tools:$PATH
#export PATH="$PATH:~/azuredatastudio-linux-x64"

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh

neofetch

### Achive Extraction
# usage: ex <file>
ex()
{
  if [ -f $1 ]; then
    case $1 in
      *.tar.bz2)	tar xjf $1 ;;      
      *.tar.gz) 	tar xzf $1 ;;      
      *.bz2) 		bunzip2 $1 ;;      
      *.rar) 		unrar x $1 ;;      
      *.gz) 		gunzip $1 ;;      
      *.tar) 		tar xf $1 ;;      
      *.tbz2) 		tar xjf $1 ;;      
      *.tgz) 		tar xzf $1 ;;      
      *.zip) 		unzip $1 ;;      
      *.Z) 		uncompress $1 ;;      
      *.7z) 		7z x $1 ;;      
      *.deb) 		ar x $1 ;;      
      *.tar.xz) 	tar xf $1 ;;      
      *.tar.zst)	unzstd $1 ;;
      *)	echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# === Aliases ===
# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# adding flags
alias cp='cp -i'	#ask's confirmation if another file with the same name already exists
