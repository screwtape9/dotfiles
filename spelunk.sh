#!/bin/bash

spelunk() {
  ROOT="$1"
  [[ ! -d "$ROOT" ]] && echo "Invalid, or not a directory." && return 1
  [[ "$ROOT" == "." ]] && return 0
  [[ "$ROOT" == ".." ]] && return 0
  echo "$ROOT" # this is a direcotry
  pushd "$ROOT" > /dev/null
  [[ "$?" != "0" ]] && return 0
  for LEAF in $(ls -a --group-directories-first); do
    if [ -d "$LEAF" ]; then
      spelunk "$LEAF" # it's a directory
    else
      echo "$LEAF" # this is a file
    fi
  done
  popd > /dev/null
}

spelunk "$1"
