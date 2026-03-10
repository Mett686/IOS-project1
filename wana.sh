#!/bin/bash

# Initialize

AFTER=""
BEFORE=""
IP=""
URI=""
COMMAND=""
LOGS=()


while [[ $# -gt 0 ]]; do
  case $1 in
    -*)
      case $1 in
        -a)
          AFTER=$2
          echo "a set $2"
          ;;
        -b)
          BEFORE=$2
          echo "b set $2"
          ;;
        -ip)
          IP=$2
          echo "ip set $2"
          ;;
        -uri)
          URI=$2
          echo "uri set $2"
          ;;
      esac
      shift 1
      ;;
    *)
      case $1 in
        list-ip |\
        list-hosts |\
        list-uri |\
        hist-ip |\
        hist-load)
          COMMAND=$1
          echo "command set $1"
          ;;
        *)
          if [[ -f $1 ]]; then
            LOGS+=("$1")
            echo "added log $1"
          else
            echo "$1 is invalid"
          fi
          ;;
      esac
  esac
  shift 1
done

echo "All logs: ${LOGS[@]}"