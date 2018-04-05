#!/bin/bash

#
# Memorize user pass
#
read -sp "Your Password: " pass;

#
# Mac App Store apps install
#
echo " ---- Mac App Store apps -----"
brew install mas
mas install 497799835  # Xcode (8.2.1)
echo " ------------ END ------------"

#
# Install peco
#
echo " ------------ Vim ------------"
brew install peco
echo " ------------ END ------------"

#
# Install fish
#
echo " ------------ fish ------------"
brew install fish
brew install ghq
which -a fish
echo $pass | sudo -S -- sh -c 'echo '/usr/local/bin/fish' >> /etc/shells'
chsh -s /usr/local/bin/fish
# fisherman
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
fisher edc/bass omf/thefuck omf/theme-bobthefish 0rax/fish-bd nvm omf/plugin-peco z yoshiori/fish-peco_select_ghq_repository
echo " ------------ END ------------"

#
# Install vim
#
echo " ------------ Vim ------------"
brew install vim --with-override-system-vi
echo " ------------ END ------------"

#
# Powerline
#
echo " --------- Powerline ---------"
# Font is 14pt Iconsolata for Powerline with Solarized Dark iterm2 colors.
git clone https://github.com/bhilburn/powerlevel9k.git ~/powerlevel9k
git clone https://github.com/powerline/fonts.git ~/fonts
~/fonts/install.sh
echo " ------------ END ------------"

#
# Install ruby
#
echo " ----------- Ruby ------------"
brew install rbenv
brew install ruby-build
rbenv --version
rbenv install -l
ruby_latest=$(rbenv install -l | grep -v '[a-z]' | tail -1 | sed 's/ //g')
rbenv install $ruby_latest
rbenv global $ruby_latest
rbenv rehash
ruby -v
echo " ------------ END ------------"

#
# Install dotfiles system
#
echo " ---------- dotfiles ---------"
git clone https://github.com/koharashota/dotfiles ~/dotfiles
~/dotfiles/dotfilesLink.sh
echo " ------------ END ------------"

#
# Install Node.js env
#
echo " ---------- Node.js ----------"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
nvm install --lts
nvm use --lts
echo " ------------ END ------------"

#
# Install Yarn
#
echo " ----------- Yarn ------------"
brew install yarn
echo " ------------ END ------------"

#
# Install wget
#
echo " ----------- wget ------------"
brew install wget
wget --version
echo " ------------ END ------------"

#
# CocoaPods
#
echo " --------- CocoaPods ---------"
echo $pass | sudo -S gem install -n /usr/local/bin cocoapods --pre
pod setup
echo " ------------ END ------------"

#
# Carthage
#
echo " --------- Carthage ----------"
brew install carthage
echo " ------------ END ------------"

#
# apps
#
echo " --------- apps ----------"
$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/app.sh
$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/appstore.sh
echo " ------------ END ------------"

