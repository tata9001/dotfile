# Path to your oh-my-zsh installation.
export ZSH=/Users/colin/.oh-my-zsh

# ZSH_THEME="colin"

DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"

# export UPDATE_ZSH_DAYS=7
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ZSH_CUSTOM=$ZSH/custom
# ENABLE_CORRECTION="true"

# plugins=(git virtualenv docker autojump colored-man-pages)

#######################################################################
#                            User Settings                            #
#######################################################################

source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8
export EDITOR='vim'
export CLICOLOR=1
export LSCOLORS=Fxbxaxdxcxegedabagacad

if [ "$TERM" = "xterm" ]; then
  export TERM=xterm-256color
fi

# python virtualenv
if [[ -d ~/.pyenv  ]]; then
    export PYENV_ROOT="${HOME}/.pyenv"
    eval "$(pyenv init -)"
    export WORKON_HOME=$HOME/.virtualenvs
    source /usr/local/bin/virtualenvwrapper.sh
fi
#######################################################################
#                         Addtional Settings                          #
#######################################################################

# enable ctrl-s
stty -ixon

# history
export HISTCONTROL=ignoredups:erasedups
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP

#######################################################################
#                           Alias Settings                            #
#######################################################################

# alias vim="mvim -v"
# alias vi="mvim -v"
alias proxy="proxychains4 -q"
alias e="emacs -nw"

## proxy
alias set_socks_proxy="export ALL_PROXY=socks5://127.0.0.1:1080"
alias set_http_proxy="export ALL_PROXY=http://127.0.0.1:8087"
alias unset_proxy="unset ALL_PROXY"

## quick file
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'

#######################################################################
#                      oh-my-zsh Packages Manger                      #
#######################################################################

source ~/.zplug/init.zsh || curl -sL zplug.sh/installer | zsh

# Load themes file
zplug "~/dotfile/zsh/colin", from:local, as:theme

# Load plugins
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "~/dotfile/zsh/alias", from:local
zplug "~/dotfile/zsh/tool", from:local
zplug "plugins/osx", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin*  ]]"
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/autojump", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh, hook-load:"source"
zplug "plugins/docker-compose", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "jhawthorn/fzy", \
    as:command, \
    rename-to:fzy, \
    hook-build:"make && sudo make install"

zplug load
