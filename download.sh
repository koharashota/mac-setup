#!/bin/bash

#
# Install homebrew.
#
echo " --------- Homebrew ----------"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew upgrade --all --cleanup
brew -v
echo " ------------ END ------------"

#
# Install git
#
echo " ------------ Git ------------"
brew install git
git --version
echo " ------------ END ------------"

#
# koharashota/mac-setup.git
#
echo " ------------ koharashota/mac-setup.git ------------"
git clone https://github.com/koharashota/mac-setup.git
echo " ------------ END ------------"
