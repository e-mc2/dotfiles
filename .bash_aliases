alias dm='docker-machine'
alias dc='docker-compose'
alias de='docker exec -ti'
alias dps='docker ps'
alias di='docker images'
alias drm='docker rm'
alias drmi='docker rmi'
alias dr='docker run'
alias ds='docker start'
alias dst='docker stop'
alias db='docker build'

alias drmi0='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'
alias dkall='docker rm $(docker ps -a -q)'
