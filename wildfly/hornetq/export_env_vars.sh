#!/bin/bash

display_help() {
  echo "Usage: . $0 [OPTION]"
  echo "   -d, --directory              Set the workspace directory "
  echo
  echo "needs to be run in user environment - prefix with '.' before running"
  exit 1
}

OPTS=`getopt -o hd: --long help,directory: -n 'export_env_vars' -- "$@"`
eval set -- "$OPTS"

WORKDIR=$PWD

while true; do
  case $1 in
    -h | --help)
      display_help
      ;;
    -d | --directory)
      WORKDIR=$(readlink -f $2)
      shift 2
      ;;
    --)
      shift ; break
      ;;
    *)
      break
      ;;
  esac
done

echo "Exporting hornetq testsuite environment variables with work directory: $WORKDIR"

export WORKSPACE=$WORKDIR
export JBOSS_HOME_1=$WORKSPACE/server1/jboss-eap
export JBOSS_HOME_2=$WORKSPACE/server2/jboss-eap
export JBOSS_HOME_3=$WORKSPACE/server3/jboss-eap
export JBOSS_HOME_4=$WORKSPACE/server4/jboss-eap
export JOURNAL_DIRECTORY_A=$WORKSPACE/journal-A
export JOURNAL_DIRECTORY_B=$WORKSPACE/journal-B

echo "finished..."

