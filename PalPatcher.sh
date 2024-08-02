#!/bin/bash

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd "$SCRIPTPATH"

# If arguments are less then 3 then error
if [ "$#" -lt 3 ]; then
    echo "Usage: ./PalPatcher.sh <oldUID> <newUID> <.sav path>"
    exit 1
fi


if [ "$#" -ne 3 ]; then
    echo "Enter oldUID: "
    read oldUID

    if [ ${#oldUID} -ne 32 ]; then
        echo "Invalid oldUID: Must be 32 characters"
        exit 1
    fi

    echo "Enter newUID: "
    read newUID

    if [ ${#newUID} -ne 32 ]; then
        echo "Invalid newUID: Must be 32 characters"
        exit 1
    fi

    echo "Enter .sav path (Either {Charecter}.sav or Level.sav): "
    read path

    if [[ $path != *".sav" ]]; then
        echo "Invalid path: Include .sav"
        exit 1
    fi
else
    oldUID=$1
    newUID=$2
    path=$3
fi

if [ ! -f "$path" ]; then
    echo "File not found: $path"
    exit 1
fi

echo "Converting $path to $path.json"
palworld-save-tools --to-json $path --output $path.json

echo "Parsing and replacing UIDs"
java -jar PalParser.jar "$oldUID" "$newUID" "$path.json"
mv temp.json $path.json

echo "Converting $path.json to $path.sav"
palworld-save-tools --from-json $path.json --output $path --force

echo "Cleaning $path.json"
rm $path.json

echo "Done"

read -p "Enter to quit"
