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

# Install more recent versions of some macOS tools.
brew install tmux python
brew install proxychains-ng the_silver_searcher
brew install tree ccat autojump
brew install htop iftop
brew install emacs-mac --with-spacemacs-icon --HEAD --with-gnutls
brew install macvim  --with-lua

# Remove outdated versions from the cellar.
brew cleanup
