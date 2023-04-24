#!/usr/bin/env bash
# shellcheck shell=bash


mkdir images documents
dir=$(pwd)
for file in "$dir"/*; do

    echo "$file"
    extension="$(echo "$file" | awk -F . '{print $NF}')"
    if [[ "${extension}" == "jpg" || "${extension}" == "png" ]]; then
        mv "$file" "$dir"/images
    elif [[ "${extension}" == "txt" || "${extension}" == "xls" ]]; then
        mv "$file" "$dir"/documents
    fi
    
done



