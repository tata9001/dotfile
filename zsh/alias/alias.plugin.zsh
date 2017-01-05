# ----------------------------------------------------------------
# Docker alias and function
# ----------------------------------------------------------------

alias doc="docker"
alias dco="docker-compose"
alias dcm="docker-machine"
alias dps="docker ps"
alias dpa="docker ps -a"
alias di="docker images"
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
alias dkd="docker run -d -P"
alias dki="docker run -i -t -P"
alias dex="docker exec -i -t"
alias drmf='docker rm -fv $(docker ps -a -q)'
dstop() { docker stop $(docker ps -a -q); }
drm() { docker rm $(docker ps -a -q); }
dri() { docker rmi $(docker images -q); }
dbu() { docker build -t=$1 .; }
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }
dbash() { docker exec -it  bash; }
dash() { docker exec -it  bash; }