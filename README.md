# GDExtension Project Creator

this is a script (currently only for linux) where you execute a script that generates a base project for your gdextension

## Installation

* Download godot-cpp -> https://github.com/godotengine/godot-cpp
* Download the content of this repo
* extract inside the `godot-cpp` folder


## How to use

* open terminal at godot-cpp folder
* type: `./create_project.sh`
* You will be asked for project name which will be the folder name and the resulting build file names
* Then it will ask the class you want to extends like: Control,Node3D,Node
* at last it will tell you to moodify `build.sh` and `move.sh`
* `build.sh` will build your project
* `move.sh` where is `OUTDIR` change to the project you want the output files to be


## EXTRA

If you understand windows `.bat`, and want to convert the .sh scripts for windows, your PR is very welcome!
