#!/bin/bash
source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../_helper.sh" #load helper

xcode-select --install # make sure xcode command line tools are installed
prompt "xcode installation finished?"
answerYesNo "" "exit 0"

#install homebrew
cecho "install homebrew" $GREEN
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

#install cask
cecho "install homebrew cask" $GREEN
brew install caskroom/cask/brew-cask
brew tap caskroom/versions # able to install other versions of existing casks
brew tap caskroom/fonts  # install system fonts