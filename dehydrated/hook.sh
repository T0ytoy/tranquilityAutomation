#!/usr/bin/env bash
set -e
set -u
set -o pipefail
 
domain="tranquility-base"
token="c5ca76f3-5b18-46e4-a6b9-73d0e1b8145b"
 
case "$1" in
    "deploy_challenge")
        curl "https://www.duckdns.org/update?domains=$domain&token=$token&txt=$4"
        echo
        ;;
    "clean_challenge")
        curl "https://www.duckdns.org/update?domains=$domain&token=$token&txt=removed&clear=true"
        echo
        ;;
    "deploy_cert")
        sudo docker restart HomeAssistant
        ;;
    "unchanged_cert")
        ;;
    "startup_hook")
        ;;
    "exit_hook")
        ;;
    *)
        echo Unknown hook "${1}"
        exit 0
        ;;
esac
