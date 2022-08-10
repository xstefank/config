# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/mstefank/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="maranCustom"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  mvn
  docker
  docker-compose
  gradle
  globalias
  gh
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Custom ENV
. ~/.env

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias zshconfig='vim ~/.zshrc'
alias i3config='vim ~/.config/i3/config'

# java

J8=1.8
J9=9
J10=10
J11=11
J12=12
J13=13
J14=14
J15=15
J16=16
J17=17
J18=18
J19=19-ea

alias j8='jenv global $J8'
alias j9='jenv global $J9'
alias j10='jenv global $J10'
alias j11='jenv global $J11'
alias j12='jenv global $J12'
alias j13='jenv global $J13'
alias j14='jenv global $J14'
alias j15='jenv global $J15'
alias j16='jenv global $J16'
alias j17='jenv global $J17'
alias j18='jenv global $J18'
alias j19='jenv global $J19'

alias jl8='jenv local $J8'
alias jl9='jenv local $J9'
alias jl10='jenv local $J10'
alias jl11='jenv local $J11'
alias jl12='jenv local $J12'
alias jl13='jenv local $J13'
alias jl14='jenv local $J14'
alias jl15='jenv local $J15'
alias jl16='jenv local $J16'
alias jl17='jenv local $J17'
alias jl18='jenv local $J18'
alias jl19='jenv local $J19'

alias js8='jenv shell $J8'
alias js9='jenv shell $J9'
alias js10='jenv shell $J10'
alias js11='jenv shell $J11'
alias js12='jenv shell $J12'
alias js13='jenv shell $J13'
alias js14='jenv shell $J14'
alias js15='jenv shell $J15'
alias js16='jenv shell $J16'
alias js17='jenv shell $J17'
alias js18='jenv shell $J18'
alias js19='jenv shell $J19'

alias j='java'
alias jj='java -jar'
alias jv='java -version'
alias jol='jj /home/mstefank/apps/jol-cli-latest.jar'

# git
alias glg="git --no-pager log --color --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit -n5"
alias glgi="git log --color --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gcane="git commit --amend --no-edit"
alias gacane="git add . && gcane"
alias gcom='git commit -m'
alias gcasm='git commit -asm'
alias ggpushf='ggpush -f'
alias gupull='git pull upstream $(git_current_branch)'
alias gmpull='git pull upstream main'
alias gmapull='git pull upstream master'
alias gu='git pull upstream main --rebase'
alias gplu='git pull upstream' 
alias gwip='git add . && git commit -am "---- WIP ----"'
alias grwip='git reset --soft @~ && git reset'
alias gch='git checkout HEAD --'
alias gfpr='git fpr'
alias gcl='hub clone'
alias gccd='gccd() { gcl $1 && cd $(echo $1 | cut -d'/' -f2)};gccd'
alias gra='hub remote add'
alias grau='grau() { hub remote add upstream "$1"/"${PWD##*/}" };grau'
alias gpr='gh pr'
alias gprco='gh pr checkout'
alias gprc='gh pr create'
alias gprv='gh pr view -w'
alias gr='git reset'
alias grf='git checkout HEAD --'
alias gre='git remote'
alias grh='git reset --hard'
alias grs='git reset --soft'
alias gcfd='git clean -fd'
alias gfr='grhh && gcfd'
alias grrr='git rerere'
alias gs='git stash'
alias gsp='git stash pop'
alias gsl='git stash list'

# mvn
alias mi='mvn install'
alias mci='mvn clean install'
alias mcif='mvn clean install -DskipTests -Denforcer.skip -Dcheckstyle.skip -Dmaven.javadoc.skip'
alias mcit='mvn clean install -DskipTests'
alias mcist='mcist() { mvn clean install -DfailIfNoTests=false -Dtest="$1" };mcist'
alias mcie='mvn clean install -fae'
alias mct='mvn clean test'
alias mcqd='mvn clean compile quarkus:dev'
alias mcin='mvn clean install -Pnative'
alias mcifn='mcif -Pnative'
alias mp='mvn package'
alias mcp='mvn clean package'
alias mcpt='mvn clean package -DskipTests'
alias mcpf='mvn clean package -DskipTests -Denforcer.skip -Dcheckstyle.skip -Dmaven.javadoc.skip'
alias mcpn='mvn clean package -Pnative'
alias mt='mvn test'
alias 🤘="mvn clean compile quarkus:dev"
alias mdt='mvn dependency:tree'
alias Mv='mvn -v'
alias -g st='-Dtest='
alias -g it='-Dit.test='
alias -g cs='-Dcheckstyle.skip'
alias -g lt='-Dorg.slf4j.simpleLogger.showDateTime=true -Dorg.slf4j.simpleLogger.dateTimeFormat=HH:mm:ss,SSS'

# mvnd
unalias mvnd

# quarkus
alias q='quarkus'

mcid='mvnd clean install'
mcpd='mvnd clean package'
alias mcifd='mvnd clean install -DskipTests -Denforcer.skip -Dcheckstyle.skip -Dmaven.javadoc.skip'
alias mcpfd='mvnd clean package -DskipTests -Denforcer.skip -Dcheckstyle.skip -Dmaven.javadoc.skip'

# idea
alias i='idea pom.xml'

# grep
alias grep='grep --color=auto'
alias ggrep='grep --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias -g G='| grep'
alias -g Gi='| grep -i'

# quarkus
qa() {
  quarkus ext add "$1" 
}
qr() {
  quarkus ext remove "$1"
}
alias qd='quarkus dev'
alias ql='quarkus ext -i'
alias qe='quarkus ext'
qcd() { 
  quarkus create app $1 
  cd ${1#*:} 
}
alias quark='quarkus create app'

# docker
alias d='docker'
alias doc='docker-compose'
alias di='docker image'
alias dis='docker images'
alias dps='docker ps'
alias dlf='docker logs -f'
alias docker-compose='podman-compose'
alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcud='docker-compose up -d'
alias dcd='docker-compose down'

# podman
alias docker=podman
alias pi='podman image'
alias pis='podman images'
alias pps='podman ps'
alias plf='podman logs -f'
alias pc='podman-compose'
alias pcu='podman-compose up'
alias pcud='podman-compose up -d'
alias pcd='podman-compose down'

# testcontainers
alias enable-test-containers='systemctl --user enable podman.socket --now; export DOCKER_HOST=unix:///run/user/${UID}/podman/podman.sock; export TESTCONTAINERS_RYUK_DISABLED=true'

# openshift
alias op='oc get pods'
alias olg='oc logs -f'

# kubernetes
alias k='kubectl'

# taskwarrior
# general
alias t=task
alias tc='task calendar'
alias tm='task modify'
alias ts='task start'
alias tst='task stop'
alias td='task done'
alias tdel='task delete'

# list
alias tlw='task list +work'
alias tlh='task list +home'
alias tlsl='task list +sl'
alias tlb='task list +backlog'
alias tlc='task project::current'

# adds
alias ta='task add'

alias twH='task add +work priority:H'
alias tw='task add +work'
alias twL='task add +work priority:L'

alias thH='task add +home priority:H'
alias th='task add +home'
alias thL='task add +home priority:L'

alias tasl='task add +sl'

alias tb='task add +backlog'

alias tac='task modify pro:current'

# httpie
alias h='http'
alias hl='hl() { http :8080/$1 };hl'

# tz - https://github.com/oz/tz/
alias tz='TZ_LIST=America/Los_Angeles,America/Chicago,America/New_York,Asia/Shanghai /home/mstefank/apps/tz/tz'

# exa
alias e='exa -l'
alias eg='exa -l --git'

# other
alias cs='cleanServer'
alias background='f(){ "$@" > /dev/null 2>&1 & disown };f'
alias notes='vim ~/Documents/notes.txt'
alias k9='kill -9'
alias ka='killall'
alias spotify='snap run spotify'

qia-pdf() {
  echo "Generating PDF from ./manuscript/$1_Stefanko_Quarkus_in_Action.adoc to ./manuscript/$1_Stefanko_Quarkus_in_Action.pdf"
  asciidoctor-pdf -r asciidoctor-pdf -r /home/mstefank/.local/share/gem/ruby/gems/asciidoctor-pdf-1.6.2/lib/sectnumoffset-treeprocessor.rb -b pdf -a pdf-style=manning -D ./manuscript ./manuscript/$1_Stefanko_Quarkus_in_Action.adoc && okular ./manuscript/$1_Stefanko_Quarkus_in_Action.pdf
}

# invert Ctrl+Space
# just reference, leaves ^@ after expansion
#bindkey -M emacs "^ " globalias
#bindkey -M viins "^ " globalias
#bindkey -M emacs " " magic-space
#bindkey -M viins " " magic-space

function my-expand() zle _expand_alias && zle expand-word
zle -N my-expand
bindkey -M emacs "^ " my-expand
bindkey -M viins "^ " my-expand
bindkey -M emacs " " magic-space
bindkey -M viins " " magic-space

# suffix aliases
alias -s {pdf,PDF}='background okular'
alias -s {jpg,JPG,png,PNG}='background gpicview'
alias -s {ods,ODS,odt,ODT,odp,ODP,doc,DOC,docx,DOCX,xls,XLS,xlsx,XLSX,xlsm,XLSM,ppt,PPT,pptx,PPTX,csv,CSV}='background libreoffice'
alias -s {html,HTML}='background google-chrome-beta'
alias -s {mp4,MP4,mov,MOV,mkv,MKV}='background vlc'
alias -s {zip,ZIP,war,WAR}="unzip -l"
alias -s {jar,JAR}="java -jar"
alias -s {gz,tar.gz}="tar -tf"
alias -s {tgz,TGZ}="tar -tf"


#
unsetopt share_history
setopt INC_APPEND_HISTORY
setopt APPEND_HISTORY

# JWT

decode_base64_url() {
  local len=$((${#1} % 4))
  local result="$1"
  if [ $len -eq 2 ]; then result="$1"'=='
  elif [ $len -eq 3 ]; then result="$1"'='
  fi
  echo "$result" | tr '_-' '/+' | openssl enc -d -base64
}

decode_jwt(){
   decode_base64_url $(echo -n $2 | cut -d "." -f $1) | jq .
}

# Decode JWT header
alias jwth="decode_jwt 1"

# Decode JWT Payload
alias jwtp="decode_jwt 2"

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# kafka
export PATH="$HOME/apps/kafka/bin:$PATH"

# jabba
[ -s "/home/mstefank/.jabba/jabba.sh" ] && source "/home/mstefank/.jabba/jabba.sh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/mstefank/apps/google-cloud-sdk/path.zsh.inc' ]; then . '/home/mstefank/apps/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/mstefank/apps/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/mstefank/apps/google-cloud-sdk/completion.zsh.inc'; fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/mstefank/.sdkman"
[[ -s "/home/mstefank/.sdkman/bin/sdkman-init.sh" ]] && source "/home/mstefank/.sdkman/bin/sdkman-init.sh"



# Add Jbang to environment
alias j!=jbang
export PATH="$HOME/.jbang/bin:$PATH"
