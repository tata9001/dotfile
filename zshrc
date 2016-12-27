# Path to your oh-my-zsh installation.
export ZSH=/Users/colin/.oh-my-zsh

# ZSH_THEME="bhilburn/powerlevel9k"

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
alias v="mvim -f"
alias vim="mvim -v"
alias vi="mvim -v"
alias pc="proxychains4"
alias e="emacs -nw"
alias set_http_proxy="export http_proxy=http://localhost:8087 https_proxy=http://localhost:8087"
alias set_socks_proxy="export http_proxy=socks5://localhost:1080 https_proxy=socks5://localhost:1080"
alias unset_proxy="unset http_proxy https_proxy"

### Plugin lists
## check antigen 
if [ !  -f ~/.antigen/antigen.zsh ]; then
    echo "antigen not found, bootstrapping."
    mkdir -p ~/.antigen
    curl -SsL  -o ~/.antigen/antigen.zsh https://raw.githubusercontent.com/zsh-users/antigen/master/bin/antigen.zsh
fi

source ~/.antigen/antigen.zsh

antigen theme co1inlee/dotfile/themes/zsh colin

antigen bundles <<EOBUNDLES
  git
  osx
  autojump
  virtualenv
  docker
  docker-compose
  colored-man-pages
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-syntax-highlighting

EOBUNDLES

### Plugin Configuration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=8

POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4
POWERLEVEL9K_SHORTEN_DELIMITER=".."
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%{%B%F{yellow}%K{blue}%}CMD%{%b%f%k%F{blue}%} %{%f%}"
POWERLEVEL9K_TIME_FORMAT="%D{%D %T}"
POWERLEVEL9K_SHOW_CHANGESET=false
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(background_jobs virtualenv time history status)

# apply plugin and theme
antigen apply

# ======= percol ======
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
