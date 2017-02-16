JAVA_HOME=
JBOSS_HOME=
EAP_HOME=$JBOSS_HOME
EAP7_HOME=$JBOSS_HOME
WF_HOME=

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#PS1="\[\033[01;36m\][\u@\h \W]\$ \[\033[00m\]"
PS1="\[\033[0;34m\]\u@\h \[\033[0;32m\]\w\[\033[0;33m\]\$(parse_git_branch)\[\033[00m\] $ "

#aliases
# todo.txt
alias t=

#i3wm
alias i3exit=


