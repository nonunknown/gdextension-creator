#!/bin/bash

read -p "Project name: " project

#copy the base dir in order to start stuff
rsync -av ./base/ "./${project,,}/"

# Assign the filename
fileClassHeader="${project,,}/src/example.h"
fileClass="${project,,}/src/example.cpp"
fileRegisterHeader="${project,,}/src/register_types.h"
fileRegister="${project,,}/src/register_types.cpp"
fileExtension="${project,,}/base.gdextension"
fileBuild="${project,,}/build.sh"
fileMove="${project,,}/move.sh"

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
projectLower="${project,,}"
projectUpper="${project^^}"
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


mv "${project,,}/src/example.h" "${project,,}/src/${classNameLower}.h"
mv "${project,,}/src/example.cpp" "${project,,}/src/${classNameLower}.cpp"
mv "${project,,}/base.gdextension" "${project,,}/${project,,}.gdextension"

printf "\n\nYour project has been created successfully!"

printf "\n\nPlease modify ${project,,}/build.sh and ${project,,}/move.sh to output your compiled files correcly"
