#!/bin/sh

if [ "$#" -eq 1 ]; then
    INSTALL_SIZE=0

    TYPE="*.apk"

    for file in $TYPE; do
        [ -e "$file" ] || continue

        size=$(ls -l "$file" | awk '{print $5}')

        INSTALL_SIZE=$(($INSTALL_SIZE + $size))
    done

    if [ "$INSTALL_SIZE" -gt 0 ]; then
        SESSION=$(pm install-create -i "$1" -S $INSTALL_SIZE | sed -n 's/.*\[\(.*\)\].*/\1/p')

        echo
        echo "[+] SESSION: $SESSION"
        echo

        INDEX=0

        for file in $TYPE; do
            [ -e "$file" ] || continue

            size=$(ls -l "$file" | awk '{print $5}')

            pm install-write -S $size $SESSION $INDEX "$file"

            ((INDEX++))
        done

        echo
        echo "[+] Installing ..."
        echo

        pm install-commit $SESSION
    fi
fi
