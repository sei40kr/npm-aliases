# alias_def.zsh
# author: Seong Yong-ju <sei40kr@gmail.com>

alias d=dirs
alias po=popd
alias pu=pushd
alias u='cd ..'
alias cx='chmod +x'

# bat
alias cat='bat --theme TwoDark'

# brew
alias brewp='brew pin'
alias brews='brew list -1'
alias brewsp='brew list --pinned'
alias bubo='brew update && brew outdated'
alias bubc='brew upgrade && brew cleanup'
alias bubu='bubo && bubc'
alias brewc='brew cleanup'
alias bsl='brew services list'
alias bsr='brew services run'
alias bson='brew services start'
alias bsoff='brew services stop'

# bundle
alias be="bundle exec"
alias bl="bundle list"
alias bp="bundle package"
alias bo="bundle open"
alias bout="bundle outdated"
alias bu="bundle update"
alias bi="bundle_install"
alias bcn="bundle clean"

# cordova
alias co='cordova'
alias cob='cordova build'
alias cor='cordova run'
alias coc='cordova clean'
alias cop='cordova platform list'
alias copa='cordova platform add'
alias copr='cordova platform remove'
alias copl='cordova plugin list'
alias copla='cordova plugin add'
alias coplr='cordova plugin remove'

# coreutils
alias md='mkdir -p'
alias rd=rmdir
alias sortnr='sort -nr'

# docker
alias di='docker info'
alias dlg='docker container logs'
alias dls='docker container ls'
alias dlsa='docker container ls -a'
alias dr='docker container run'
alias dt='docker top'
alias dv='docker version'
alias dpo='docker container port'
alias dpu='docker pull'
alias dx='docker container exec'
alias dbl='docker build'
alias dhh='docker help'
alias dpsa='docker container ps -a'
alias dils='docker image ls'
alias dit='docker image tag'
alias dip='docker image push'
alias dib='docker image build'
alias dnls='docker network ls'
alias dnc='docker network create'
alias dncn='docker network connect'
alias dndcn='docker network disconnect'
alias dnrm='docker network rm'
alias dvls='docker volume ls'
alias dvclean='docker volume rm $(docker volume ls -qf dangling=true)'
# remove docker intermediate images
alias drmi='docker rmi -f $(docker images -aq --filter dangling=true) 2>/dev/null'
# wipe everything, kill all running processes, remove all containers and images
alias dwipe='docker kill $(docker ps -q) 2>/dev/null;docker rm $(docker ps -aq) 2>/dev/null;docker rmi -f $(docker images -aq) 2>/dev/null'

# emacs
alias emacs='emacs-wrapper'
alias e='emacs'
alias te='EMACS_IN_TERMINAL=1 emacs-wrapper'
alias eeval='emacs-wrapper -e'

# exa
alias ls='exa -F'
alias la='exa -laFh'
alias tree='exa -T'

# fzf
alias preview="fzf --preview 'bat --color always {}'"

# gdb
alias gdb='gdb -ex start'

# gem
alias gin="gem install"
alias gun="gem uninstall"
alias gli="gem list"

# kubectl
alias k=kubectl
# Apply a YML file
alias kaf='kubectl apply -f'
# Drop into an interactive terminal on a container
alias keti='kubectl exec -ti'
# Manage configuration quickly to switch contexts between local, dev ad staging
alias kcuc='kubectl config use-context'
alias kcsc='kubectl config set-context'
alias kcdc='kubectl config delete-context'
alias kccc='kubectl config current-context'
# List all contexts
alias kcgc='kubectl config get-contexts'
# General aliases
alias kdel='kubectl delete'
alias kdelf='kubectl delete -f'
# Pod management
alias kgp='kubectl get pods'
alias kgpw='kgp --watch'
alias kgpwide='kgp -o wide'
alias kep='kubectl edit pods'
alias kdp='kubectl describe pods'
alias kdelp='kubectl delete pods'
alias kgpl='kgp -l'    # get pod by label: kgpl "app=myapp" -n myns
# Service management
alias kgs='kubectl get svc'
alias kgsw='kgs --watch'
alias kgswide='kgs -o wide'
alias kes='kubectl edit svc'
alias kds='kubectl describe svc'
alias kdels='kubectl delete svc'
# Ingress management
alias kgi='kubectl get ingress'
alias kei='kubectl edit ingress'
alias kdi='kubectl describe ingress'
alias kdeli='kubectl delete ingress'
# Namespace management
alias kgns='kubectl get namespaces'
alias kens='kubectl edit namespace'
alias kdns='kubectl describe namespace'
alias kdelns='kubectl delete namespace'
alias kcn='kubectl config set-context "$(kubectl config current-context)" --namespace'
# ConfigMap management
alias kgcm='kubectl get configmaps'
alias kecm='kubectl edit configmap'
alias kdcm='kubectl describe configmap'
alias kdelcm='kubectl delete configmap'
# Secret management
alias kgsec='kubectl get secret'
alias kdsec='kubectl describe secret'
alias kdelsec='kubectl delete secret'
# Deployment management
alias kgd='kubectl get deployment'
alias kgdw='kgd --watch'
alias ked='kubectl edit deployment'
alias kdd='kubectl describe deployment'
alias kdeld='kubectl delete deployment'
alias ksd='kubectl scale deployment'
alias krsd='kubectl rollout status deployment'
# Rollout management
alias kgrs='kubectl get rs'
alias krh='kubectl rollout history'
alias kru='kubectl rollout undo'
# Statefulset management
alias kgss='kubectl get statefulset'
alias kgssw='kgss --watch'
alias kgsswide='kgss -o wide'
alias kess='kubectl edit statefulset'
alias kdss='kubectl describe statefulset'
alias kdelss='kubectl delete statefulset'
alias ksss='kubectl scale statefulset'
alias krsss='kubectl rollout status statefulset'
# Port forwarding
alias kpf='kubectl port-forward'
# Tools for accessing all information
alias kga='kubectl get all'
alias kgaa='kubectl get all --all-namespaces'
# Logs
alias kl='kubectl logs'
alias klf='kubectl logs -f'
# File copy
alias kcp='kubectl cp'
# Node management
alias kgno='kubectl get nodes'
alias keno='kubectl edit node'
alias kdno='kubectl describe node'
alias kdelno='kubectl delete node'
# PVC management
alias kgpvc='kubectl get pvc'
alias kgpvcw='kgpvc --watch'
alias kepvc='kubectl edit pvc'
alias kdpvc='kubectl describe pvc'
alias kdelpvc='kubectl delete pvc'

# lazydocker
alias lzd=lazydocker

# ncdu
alias du='ncdu --color dark -rr -x --exclude .git --exclude node_modules'

# npm
alias npmg='npm i -g '
alias npmS='npm i -S '
alias npmD='npm i -D '
alias npmE='PATH="$(npm bin):${PATH}"'
alias npmO='npm outdated'
alias npmV='npm -v'
alias npmL='npm list'
alias npmL0='npm ls --depth=0'
alias npmst='npm start'
alias npmt='npm test'
alias npmR='npm run'
alias npmP='npm publish'
alias npmI='npm init'

# pip
alias pip='noglob pip'

# prettyping
alias ping='prettyping --nolegend'

# rbenv
alias rubies='rbenv versions'
alias gemsets='rbenv gemset list'

# rg
alias notes="rg 'TODO|FIXME|HACK|OPTIMIZE|REVIEW'"
alias pygrep="rg --iglob '**/*.py'"

# ruby
alias rb='ruby'

# ssh
alias ssh='env TERM=xterm-256color ssh'

# top
alias top='htop'

# yarn
alias yd='yarn dev'
alias ytc='yarn test --coverage'
