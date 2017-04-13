#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# brew tap
brew tap caskroom/cask
brew tap railwaycat/emacsmacport
brew tap universal-ctags/universal-ctags
#brew tap neovim/neovim

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install more recent versions of some macOS tools.
brew install tmux python reattach-to-user-namespace
brew install proxychains-ng the_silver_searcher
brew install tree ccat autojump
brew install htop iftop
brew install emacs-mac --HEAD --with-official-icon --with-ctags  --with-gnutls
brew install vim --with-lua  ---with-override-system-vi --HEAD
#brew install neovim  --HEAD
brew install universal-ctags --HEAD


# Remove outdated versions from the cellar.
brew cleanup
