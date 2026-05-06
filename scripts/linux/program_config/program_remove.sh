#!/bin/bash

PROGRAM="<program_name>"
BIN_PATH="<PATH>"

remove(){
    INSTALL_PATH=$(which "$1")
    if [ -z "$INSTALL_PATH" ]
    then
        echo -e "\nProgram : ""$1"" DOESN'T EXIST ! "
        echo
    else
        echo -e "\nProgram : ""$1"
        echo -e "\nRemove PATH : ""$2"
        echo -e "\nInstall PATH : ""$INSTALL_PATH"
        echo
        update-alternatives --remove "$1" "$2"
    fi
}

while getopts "i:r:" flag
do
    case "${flag}" in
        i) PROGRAM="${OPTARG}";;
        r) BIN_PATH="${OPTARG}";;
    esac
done

remove "$PROGRAM" "$BIN_PATH"
