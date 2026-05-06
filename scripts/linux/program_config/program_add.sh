#!/bin/bash

PROGRAM="<program_name>"
BIN_PATH="<PATH>"
PRIORITY=1

add(){
    INSTALL_PATH=$(which "$1")
    if [ -z "$INSTALL_PATH" ]
    then
        INSTALL_PATH="/usr/local/bin/$1"
    fi
    echo -e "\nProgram : ""$1"
    echo -e "\nActual PATH : ""$2"
    echo -e "\nInstall PATH : ""$INSTALL_PATH"
    echo -e "\nPriority = ""$3"
    echo
    update-alternatives --install "$INSTALL_PATH" "$1" "$2" "$3"
}

while getopts "i:a:p:" flag
do
    case "${flag}" in
        i) PROGRAM="${OPTARG}";;
        a) BIN_PATH="${OPTARG}";;
        p) PRIORITY="${OPTARG}";;
    esac
done

add "$PROGRAM" "$BIN_PATH" "$PRIORITY"
