#!/bin/bash

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd "$SCRIPTPATH"

echo "Enter oldUID: "
read oldUID

echo "Enter newUID: "
read newUID

echo "Enter .sav path (Either {Charecter}.sav or Level.sav): "
read path

echo "Converting $path to $path.json"
palworld-save-tools --to-json $path --output $path.json

echo "Parsing $path to $path.json"
java -jar PalParser.jar "$oldUID" "$newUID" "$path.json"
mv $path.temp.json $path.json

echo "Converting $path.json to $path.sav"
palworld-save-tools --from-json $path.json --output $path --force

echo "Cleaning $path.json"
rm $path.json

echo "Done"
