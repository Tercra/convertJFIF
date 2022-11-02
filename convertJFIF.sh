#!/bin/bash

#converts a folder of JFIF images to PNG images (based on the path location

if [ $# -lt 1 ]
then
    echo "A path to a directory has not been provided."
    exit
fi

if [ ! -d $1 ]
then
    echo "Provided path is not a valid directory"
    exit
fi

changes () {
    # echo $1
    name="${1%.jfif}.png"

    # Check if there is going to a file that will be overwritten if conversion were to take place
    if [ -f "$name" ]
    then
        echo "There already exists a file named: $name"
        exit
    fi

    convert "$1" "$name"

    # Confirm if the newly made file was actually made
    if [ ! -f "$name" ]
    then
        echo "$name has not been made"
        exit
    fi
    rm "$1"
}

export -f changes

# convert FgSWteHVUAEsZ8r.jfif FgSWteHVUAEsZ8r.png
find "$1" -name "*.jfif" -type f -exec bash -c 'changes "$0"' {} \;

echo "Finished converting JFIF images to PNG images"
exit