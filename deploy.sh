#!/bin/bash

uname_response="$(uname -s)"
case "${uname_response}" in
    Linux*)     machine=linux;;
    Darwin*)    machine=mac;;
    CYGWIN*)    machine=cygwin;;
    MINGW*)     machine=minigw;;
    *)          machine="UNKNOWN:${uname_response}"
esac

if [ "${machine}" == "mac" ]
  then
    bash scripts/deploy_mac.sh
  else
    echo "not supported yet"
fi
