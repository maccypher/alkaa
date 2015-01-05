#!/bin/bash
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

git_user() {
  git config --get user.name
}

git_email() {
  git config --get user.email
}

# define prefix color and text
export PS1="\[\e[0m\][\[\e[1;36m\]\w\[\e[0m\]] \[\e[1;30m\]\$(parse_git_branch)\[\e[0m\]-> "
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export TERM=xterm-256color

source ~/.nvm/nvm.sh # activate nvm
#nvm use 0.11 # active node version

# load bashrc, if available
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# load aliases, if available
if [ -f ~/.aliases ]; then
   source ~/.aliases
fi

# start tmux
if [ -z "$TMUX" ]; then # if tmux isnt running, start it
  tmux
fi

# show configured git user
echo -e "Working as \033[40;96m$(git_user)\033[0;0m[\033[46;30m$(git_email)\033[0;0m]"