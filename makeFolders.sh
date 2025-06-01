#!/bin/bash

folders = (
    "$HOME/Documents/Scripts"
    "$HOME/Documents/Scripts/Apple_Scripts"
    "$HOME/Documents/Scripts/Git/Private"
    "$HOME/Documents/Scripts/Git/Public"
    "$HOME/Documents/Scripts/Go"
    "$HOME/Documents/Scripts/HTML"
    "$HOME/Documents/Scripts/Javascript"
    "$HOME/Documents/Scripts/Project_Ideas"
    "$HOME/Documents/Scripts/Python"
    "$HOME/Documents/Scripts/Bash"
    "$HOME/Documents/Scripts/PHP"
    "$HOME/Documents/Scripts/SQL"
    "$HOME/Documents/Scripts/Powershell"
    "$HOME/Documents/Scripts/JQuery"
)

subfolders = (
    "Works"
    "Draft"
    "Learning"
    "Archive"
)

for folder in "${folders[@]}"; do
  mkdir -p $folder
  echo "Making $folder"
  pushd folder
  
  for subfolder in "${subfolders[@]}"; do 
    mkdir -p $subfolder
    echo "Making $folder/$subfolder"
  done

  popd 
done
