#!/bin/bash

read -p "Project name: " project

# Project name in lower- and uppercase
projectLower="${project,,}"
projectUpper="${project^^}"

# Replace any whitespace with _
projectLower="${projectLower// /_}"
projectUpper="${projectUpper// /_}"

#copy the base dir in order to start stuff
rsync -av ./base/ "./$projectLower/"

# Assign the filename
fileClassHeader="$projectLower/src/example.h"
fileClass="$projectLower/src/example.cpp"
fileRegisterHeader="$projectLower/src/register_types.h"
fileRegister="$projectLower/src/register_types.cpp"
fileExtension="$projectLower/base.gdextension"
fileBuild="$projectLower/build.sh"
fileMove="$projectLower/move.sh"

#search words
search_class=CNAME
search_class_lower=LOWERC
search_class_upper=UPPERC
search_extends=EXTENDS
search_extends_lower=LOWEXT
search_project_lower=LOWERP
search_project_upper=UPPERP

# Take the search string
read -p "Enter the class name: " className
read -p "Enter the class which you're going to extend from godot: " extends

extendsLower=${extends,,}
classNameLower=${className,,}
classNameUpper=${className^^}

echo $className
echo $classNameLower
echo $classNameUpper
echo $extends
echo $extendsLower
echo $project
echo $projectUpper
echo $projectLower

sed -i "s/$search_class/$className/g" "$fileClassHeader"
sed -i "s/$search_class/$className/g" "$fileClass"
sed -i "s/$search_class/$className/g" "$fileRegister"

sed -i "s/$search_class_lower/$classNameLower/g" "$fileRegisterHeader"
sed -i "s/$search_class_lower/$classNameLower/g" "$fileRegister"
sed -i "s/$search_class_lower/$classNameLower/g" "$fileExtension"
sed -i "s/$search_class_lower/$classNameLower/g" "$fileClass"

sed -i "s/$search_class_upper/$classNameUpper/g" "$fileClassHeader"
sed -i "s/$search_class_upper/$classNameUpper/g" "$fileRegisterHeader"

sed -i "s/$search_extends/$extends/g" "$fileClassHeader"

sed -i "s/$search_extends_lower/$extendsLower/g" "$fileClassHeader"

sed -i "s/$search_project_lower/$projectLower/g" "$fileExtension"
sed -i "s/$search_project_lower/$projectLower/g" "$fileBuild"
sed -i "s/$search_project_lower/$projectLower/g" "$fileMove"
sed -i "s/$search_project_lower/$projectLower/g" "$fileRegister"
sed -i "s/$search_project_lower/$projectLower/g" "$fileRegisterHeader"

sed -i "s/$search_project_upper/$projectUpper/g" "$fileRegisterHeader"


mv "$projectLower/src/example.h" "$projectLower/src/$classNameLower.h"
mv "$projectLower/src/example.cpp" "$projectLower/src/$classNameLower.cpp"
mv "$projectLower/base.gdextension" "$projectLower/$projectLower.gdextension"

printf "\n\nYour project has been created successfully!"

printf "\n\nPlease modify $projectLower/build.sh and $projectLower/move.sh to output your compiled files correcly"
