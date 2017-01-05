# Path to your oh-my-zsh installation.
export ZSH=/Users/colin/.oh-my-zsh

# ZSH_THEME="colin"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

 # Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=$ZSH/custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git virtualenv docker autojump colored-man-pages)

PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

### User configuration
source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8
export EDITOR='vim'
export CLICOLOR=1
export LSCOLORS=Fxbxaxdxcxegedabagacad
TERM=xterm-256color
# enable ctrl-s
stty -ixon

### alias settings
alias vim="mvim -v"
alias vi="mvim -v"
alias pc="proxychains4 -q"
alias e="emacs -nw"
alias ls="ls --color"

## proxy
alias sps="export ALL_PROXY=socks5://127.0.0.1:1080"
alias spt="export ALL_PROXY=http://127.0.0.1:8087"
alias unset_proxy="unset ALL_PROXY"
## quick file
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'
### Plugin lists
## check antigen 
if [ !  -f ~/.antigen/antigen.zsh ]; then
    echo "antigen not found, bootstrapping."
    mkdir -p ~/.antigen
    curl -SsL  -o ~/.antigen/antigen.zsh https://raw.githubusercontent.com/zsh-users/antigen/master/bin/antigen.zsh
fi

#######################################################################
#                      oh-my-zsh Packages Manger                      #
#######################################################################

source ~/.zplug/init.zsh

# Load themes file
zplug "~/dotfile/zsh/colin", from:local, as:theme

# Load plugins
zplug "zplug/zplug", lazy:true
zplug "~/dotfile/zsh/alias", from:local
zplug "plugins/osx", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin*  ]]"
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/autojump", from:oh-my-zsh 
zplug "plugins/virtualenv", from:oh-my-zsh 
zplug "plugins/docker", from:oh-my-zsh, hook-load:"source"
zplug "plugins/docker-compose", from:oh-my-zsh 
zplug "plugins/colored-man-pages", from:oh-my-zsh 
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"


# zplug check returns true if all packages are installed
# # Therefore, when it returns false, run zplug install
if ! zplug check; then
    zplug install
fi

# source plugins and add commands to the PATH
zplug load 

# configfile: ~/.percol.d/rc.py
function exists { which $1 &> /dev/null }

exists percol || pip install percol

if exists percol; then
    function percol_select_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(fc -l -n 1 | eval $tac | percol --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }

    zle -N percol_select_history
    bindkey '^R' percol_select_history
fi
