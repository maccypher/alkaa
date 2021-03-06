#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPTS=$DIR/_scripts
source $DIR/_helper.sh #load helper

prompt "install homebrew?"
answerYesNo "source $SCRIPTS/homebrew.sh" "cecho skipping $GREY"

readCaskTasks $DIR/cask_tasks
prompt "install cask stuff (${tasks[*]})?"
answerYesNo "source $SCRIPTS/cask.sh" "cecho skipping $GREY"

prompt "install nodeJS?"
answerYesNo "source $SCRIPTS/node.sh" "cecho skipping $GREY"

prompt "install tmux?"
answerYesNo "source $SCRIPTS/tmux.sh" "cecho skipping $GREY"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" # make sure we have the correct DIR
#set aliases from repo
link "$DIR/aliases" "$HOME/.aliases"
link "$DIR/bash_profile" "$HOME/.bash_profile"
link "$DIR/gitconfig" "$HOME/.gitconfig"

echo ""

#deactivate cloud sync with unsaved documents
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
cecho "deactivated cloud sync for non saved files" $GREEN

echo ""
echo ""

cecho "done" $GREEN
