#!/bin/bash
# shellcheck shell=bash


extensions=(
    'jpg'
    'png'
    'txt'
    'xls'
)

for item in "${extensions[@]}"; do

    if [[ ("${item}" == "jpg" ) || ("${item}" == "png" ) ]]; then
        for((i=1;i<6;i++)); do
            touch image_"${i}"."${item}"
        done
    else
        for((i=1;i<6;i++)); do
            touch file_"${i}"."${item}"
        done    
    fi
      
done


