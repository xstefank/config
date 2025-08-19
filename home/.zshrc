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
  spring
  kubectl
  vi-mode
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Custom ENV
. ~/.my-env
. ~/.secret-env

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
alias kittyconfig='vim ~/.config/kitty/kitty.conf'

# java

J8=1.8
J11=11
J17=17
J21=21
J23=23
J24=24
J25=25

alias j8='jenv global $J8'
alias j11='jenv global $J11'
alias j17='jenv global $J17'
alias j21='jenv global $J21'
alias j23='jenv global $J23'
alias j24='jenv global $J24'
alias j25='jenv global $J25'

alias jl8='jenv local $J8'
alias jl11='jenv local $J11'
alias jl17='jenv local $J17'
alias jl21='jenv local $J21'
alias jl23='jenv local $J23'
alias jl24='jenv local $J24'
alias jl25='jenv local $J25'

alias js8='jenv shell $J8'
alias js11='jenv shell $J11'
alias js17='jenv shell $J17'
alias js21='jenv shell $J21'
alias js23='jenv shell $J23'
alias js24='jenv shell $J24'
alias js25='jenv shell $J25'

alias j='java'
alias jj='java -jar'
alias jv='java -version'
alias jol='jj /home/mstefank/apps/jol-cli-latest.jar'
alias jf='jf() { jps | grep -e "$1" | cut -d " " -f1 };jf'
alias jl='java --source 22 --enable-preview'
alias jp='java -XX:+UnlockDiagnosticVMOptions -XX:+DebugNonSafepoints -XX:+EnableDynamicAgentLoading -jar'

# graalvm
export GRAALVM_HOME=$HOME/.sdkman/candidates/java/24-graalce

# git
alias glg="git --no-pager log --color --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit -n5"
alias glgi="git log --color --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gcane="git commit --amend --no-edit"
alias gamen="git commit --amend"
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
alias gfu='git fetch upstream'
alias gcl='gh repo clone'
alias gccd='gccd() { gcl $1 && cd $(echo $1 | cut -d'/' -f2)};gccd'
alias gra='gra() { git remote add "$1" "git@github.com:$1/${PWD##*/}.git" };gra'
alias grau='grau() { git remote add upstream "git@github.com:$1/${PWD##*/}.git" };grau'
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
alias mc='mvn clean'
alias mci='mvn clean install'
alias mcif='mvn clean install -DskipTests -Denforcer.skip -Dcheckstyle.skip -Dmaven.javadoc.skip'
alias mcit='mvn clean install -DskipTests'
alias mcist='mcist() { mvn clean install -DfailIfNoTests=false -Dtest="$1" };mcist'
alias mcie='mvn clean install -fae'
alias mct='mvn clean test'
alias mcqd='mvn clean compile quarkus:dev'
alias mcin='mci -Pnative'
alias mcinc='mci -Pnative -Dquarkus.native.container-build=true'
alias mcifn='mcif -Pnative'
alias mcifnc='mcif -Pnative -Dquarkus.native.container-build=true'
alias mp='mvn package'
alias mcp='mvn clean package'
alias mcpt='mvn clean package -DskipTests'
alias mcpf='mvn clean package -DskipTests -Denforcer.skip -Dcheckstyle.skip -Dmaven.javadoc.skip'
alias mcpfn='mcpf -Pnative'
alias mcpn='mcp -Pnative'
alias mcpnc='mcp -Pnative -Dquarkus.native.container-build=true'
alias mcpfn='mcpf -Pnative'
alias mcpfnc='mcpf -Pnative -Dquarkus.native.container-build=true'
alias mt='mvn test'
alias 🤘="mvn clean compile quarkus:dev"
alias mdt='mvn dependency:tree'
alias Mv='mvn -v'
alias mq='mvn -Dquickly'
alias -g st='-Dtest='
alias -g it='-Dit.test='
alias -g cs='-Dcheckstyle.skip'
alias -g lt='-Dorg.slf4j.simpleLogger.showDateTime=true -Dorg.slf4j.simpleLogger.dateTimeFormat=HH:mm:ss,SSS'

# quarkus
alias q='quarkus'

alias mcid='mvnd clean install'
alias mcpd='mvnd clean package'
alias mcifd='mvnd clean install -DskipTests -Denforcer.skip -Dcheckstyle.skip -Dmaven.javadoc.skip'
alias mcpfd='mvnd clean package -DskipTests -Denforcer.skip -Dcheckstyle.skip -Dmaven.javadoc.skip'

# RSS
alias rss='rss() { ps -o pid,rss,command -p $(pgrep -f "$1") | numfmt --header --from-unit=1024 --to=iec --field 2 | column -t  };rss'

# idea
alias i='my-idea'
alias id='idea.sh'
alias iqd='i && qd'

# grep
alias grep='grep --color=auto'
alias ggrep='grep --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias -g G='| grep'
alias -g Gi='| grep -i'

# clipcopy
alias -g C='| tee /dev/tty | clipcopy'

# quarkus
qa() {
  quarkus ext add "$@" 
}
qrm() {
  quarkus ext remove "$@"
}
alias qd='quarkus dev'
alias qdc='quarkus dev --clean'
alias ql='quarkus ext -i'
alias qe='quarkus ext'
quark() { 
  quarkus create app "io.xstefank:$1" 
  cd "${1#*:}"
}
quarkl() {
  quarkus create app -P io.quarkus::999-SNAPSHOT "io.xstefank:$1"
  cd "${1#*:}"
}
quark-test() {
  quark "io.xstefank:$1" && iqd
}

# nautilus
alias n='nautilus . &; disown %1'

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
alias ph='. podman-host'
alias uph='. unset-podman-host'
alias pi='podman image'
alias pis='podman images'
alias pps='podman ps'
alias plf='podman logs -f'
alias pc='podman-compose'
alias pcu='podman-compose up'
alias pcud='podman-compose up -d'
alias pcd='podman-compose down'
alias prl='podman run --rm -p 8080:8080'

# testcontainers
alias enable-test-containers='systemctl --user enable podman.socket --now; export DOCKER_HOST=unix:///run/user/${UID}/podman/podman.sock; export TESTCONTAINERS_RYUK_DISABLED=true'

# openshift
alias op='oc get pods'
alias olg='oc logs -f'

# kubernetes
alias k='kubectl'
alias kc='kubectl cluster-info'
alias kap='k apply -f '
alias kdel='k delete -f '
alias kg='kubectl get'
alias ka='kubectl apply'
alias kd='kubectl delete'

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
alias e='exa -la'
alias eg='exa -la --git'

# xcp
alias cp=xcp

# dnf
alias di='sudo dnf install -y'

# other
alias cs='cleanServer'
alias background='f(){ "$@" > /dev/null 2>&1 & disown };f'
alias notes='vim ~/.secret/notes.txt'
alias k9='kill -9'
alias ka='killall'
alias spotify='snap run spotify'
alias kj="jps | grep quarkus-run | cut -d ' ' -f1 | xargs kill -9"
alias rr='rm -rf'
alias ocz='ocz() { openai-grammar $1 C };ocz'
alias osl='osl() { openai-grammar -l Slovak $1 C };osl'
alias svg='svg() { inkscape -p $1 -o $(echo $1 | sed -e "s/.png$/.svg/") };svg'
alias -g s='2>&1 | less'
alias fs='java -jar ~/GIT/xstefank/ai-cli/fs/target/quarkus-app/quarkus-run.jar'
alias jaeger='docker run --rm -p 16686:16686 -p 4317:4317 docker.io/jaegertracing/all-in-one:1'


qia-pdf() {
  echo "Generating PDF from ./manuscript/$1_Stefanko_Quarkus_in_Action.adoc to ./manuscript/PDFs/$1_Stefanko_Quarkus_in_Action.pdf"
  asciidoctor-pdf -r asciidoctor-pdf -r /home/mstefank/.local/share/gem/ruby/gems/asciidoctor-pdf-2.3.19/lib/sectnumoffset-treeprocessor.rb -b pdf -a pdf-style=manning -D ./manuscript/PDFs ./manuscript/$1_Stefanko_Quarkus_in_Action.adoc && google-chrome-stable ./manuscript/PDFs/$1_Stefanko_Quarkus_in_Action.pdf
}

qia-pdf-code-icon() {
  echo "Generating PDF from ./manuscript/code-icon/$1_Stefanko_Quarkus_in_Action-code-icon.adoc to ./manuscript/PDFs/code-icon/$1_Stefanko_Quarkus_in_Action-code-icon.pdf"
  asciidoctor-pdf -r asciidoctor-pdf -r /home/mstefank/.local/share/gem/ruby/gems/asciidoctor-pdf-2.3.19/lib/sectnumoffset-treeprocessor.rb -b pdf -a pdf-style=manning -D ./manuscript/PDFs/code-icon ./manuscript/code-icon/$1_Stefanko_Quarkus_in_Action-code-icon.adoc && google-chrome-stable ./manuscript/PDFs/code-icon/$1_Stefanko_Quarkus_in_Action-code-icon.pdf
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
alias -s {pdf,PDF}='background google-chrome-stable'
alias -s {jpg,jpeg,JPG,png,PNG}='background google-chrome-stable'
alias -s {ods,ODS,odt,ODT,odp,ODP,doc,DOC,docx,DOCX,xls,XLS,xlsx,XLSX,xlsm,XLSM,ppt,PPT,pptx,PPTX,csv,CSV}='background libreoffice'
alias -s {html,HTML}='background google-chrome-stable'
alias -s {mp4,MP4,mov,MOV,mkv,MKV}='background vlc'
alias -s {zip,ZIP,war,WAR}="unzip -l"
alias -s {jar,JAR}="java -jar"
alias -s {gz,tar.gz}="tar -tf"
alias -s {tgz,TGZ}="tar -tf"

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

# cargo
export PATH="$PATH:$HOME/.cargo/bin"

# snap
export PATH="$PATH:/var/lib/snapd/snap/bin"

# pip
export PATH="$PATH:/home/mstefank/.local/bin"

# go
export PATH="$PATH:/home/mstefank/go/bin"

# krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# jabba
[ -s "/home/mstefank/.jabba/jabba.sh" ] && source "/home/mstefank/.jabba/jabba.sh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/mstefank/apps/google-cloud-sdk/path.zsh.inc' ]; then . '/home/mstefank/apps/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/mstefank/apps/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/mstefank/apps/google-cloud-sdk/completion.zsh.inc'; fi

# The next line enables shell command completion for quarkus CLI.
source <(cat ~/completion)

# Add Jbang to environment
alias j!=jbang
export PATH="$HOME/.jbang/bin:$PATH"

# openshift
if [ $commands[oc] ]; then
  source <(oc completion zsh)
  compdef _oc oc
fi

# linuxbrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/usr/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/usr/etc/profile.d/conda.sh" ]; then
#        . "/usr/etc/profile.d/conda.sh"
#    else
#        export PATH="/usr/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

# prospero
alias prospero='/home/mstefank/GIT/xstefank/prospero/prospero'
alias prospero-extras='java -jar /home/mstefank/GIT/xstefank/prospero-extras/target/prospero-extras-*-shaded.jar'

# QR codes
alias create-qr='jbang qrcode@xam.dk'
qr() {
  jbang qrcode@xam.dk "$1" -i "/home/mstefank/GIT/xstefank/backups/profile/profile-50.jpg" -o "./qr-$(date '+%Y-%m-%d-%H:%M:%S-%3N').png"
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/mstefank/.sdkman"
[[ -s "/home/mstefank/.sdkman/bin/sdkman-init.sh" ]] && source "/home/mstefank/.sdkman/bin/sdkman-init.sh"

