#!/bin/bash

#
# repository update
#
git checkout master
git pull origin master

#
# Homebrew update and upgrade
#
brew upgrade --creanup

#
# App Store app upgrade
#
mas upgrade
