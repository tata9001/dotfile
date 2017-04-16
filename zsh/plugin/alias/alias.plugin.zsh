# ----------------------------------------------------------------
# General alias and function
# ----------------------------------------------------------------

# ----------------------------------------------------------------
# Docker alias and function
# ----------------------------------------------------------------

alias dok="docker"
alias dco="docker-compose"
alias dcm="docker-machine"

alias dps="docker ps"
alias dpa="docker ps -a"
alias di="docker images"
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
alias dit="docker run -it"
alias dex="docker exec -i -t"
alias drmaf='docker rm -fv $(docker ps -a -q)'
alias drmi="docker rmi"
alias drmif="docker rmi -f"
alias drm="docker rm"
alias drmf="docker rm -f"
alias dcone="docker run -it --rm"

alias dcb='docker-compose build'
alias dce='docker-compose exec'
alias dcps='docker-compose ps'
alias dcrestart='docker-compose restart'
alias dcrm='docker-compose rm'
alias dcrmf='docker-compose rm -f'
alias dcr='docker-compose run'
alias dcstop='docker-compose stop'
alias dcup='docker-compose up'
alias dcdn='docker-compose down'
alias dcl='docker-compose logs'
alias dclf='docker-compose logs --follow'

drmin() {docker images|grep "<none>"|awk '{print $3}'|xargs docker rmi;}
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }
