# install brew packages
BASEDIR=$(cd `dirname $0`; pwd)

install_brew(){
    # brew tap
    brew tap caskroom/cask
    brew tap railwaycat/emacsmacport
    brew tap universal-ctags/universal-ctags
    brew tap neovim/neovim

    # Make sure we’re using the latest Homebrew.
    brew update

    # Upgrade any already-installed formulae.
    brew upgrade

    # Install command-line tools using Homebrew.
    brew install brew-cask
    brew install emacs-mac --HEAD --with-official-icon --with-ctags  --with-gnutls
    # brew install vim --with-lua  ---with-override-system-vi --HEAD
    brew install neovim  --HEAD
    brew install universal-ctags --HEAD
    brew install findutils moreutils coreutils
    brew install gnu-sed --with-default-names
    brew install reattach-to-user-namespace
    brew install proxychains-ng
    brew install the_silver_searcher
    brew install tmux tree ccat autojump htop iftop fzf zsh

    brewinstall figlet
    # Remove outdated versions from the cellar.
    brew cleanup

}

install_brew_cask() {
    brew cask install iterm2
    brew cask install atom
}

install_tools(){
    ## Python stack
    # pyenv
    curl https://bootstrap.pypa.io/get-pip.py | python
    curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
    # zplug
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
    # SpaceVim
    curl -sLf https://spacevim.org/install.sh | bash
    # spacemacs
    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

}

install_links(){
    mkdir ~/.pip && cp $BASEDIR/python/pip.conf ~/.pip/
    mkdir ~/.percol.d && cp $BASEDIR/python/percol.py ~/.percol.d/rc.py

    ln -sf $BASEDIR/spacemacs.d/ ~/.spacemacs.d
    ln -sf $BASEDIR/SpaceVim.d ~/.SpaceVim.d

    ln -sf $BASEDIR/zsh/zshrc ~/.zshrc
    ln -sf $BASEDIR/zsh/zlogin ~/.zlogin
    ln -sf $BASEDIR/zsh/zpreztorc ~/.zpreztorc

}

install(){
    install_brew
    install_brew_cask
    install_tools
    install_links
}

$@
