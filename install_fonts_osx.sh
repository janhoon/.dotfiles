#!/bin/zsh

fonts_list=(
  font-jetbrains-mono-nerd-font
)

brew tap homebrew/cask-fonts

for font in "${fonts_list[@]}"
do
  brew install --cask "$font"
done
exit
