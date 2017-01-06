#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# brew tap
brew tap caskroom/cask
brew tap railwaycat/emacsmacport
brew tap caskroom/cask

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install more recent versions of some macOS tools.
brew install emacs-mac --with-spacemacs-icon --HEAD --with-gnutls
brew install macvim --with-override-system-vi --without-python --with-override-system-vim --with-lua
brew install proxychains-ng the_silver_searcher  
brew install tmux python 
brew install tree ccat autojump
brew install htop iftop

# Remove outdated versions from the cellar.
brew cleanup
