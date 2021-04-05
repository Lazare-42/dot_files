#!/bin/bash

vimBundleFile=$(pwd)"/bundle_repos_to_clone.txt"
cd ~/


###
### VIM 
###

if ! git clone https://github.com/Lazare-42/vimrc.git
then
    echo "Could not clone vimrc repo"
    exit 1
fi

mv ~/vimrc/.vimrc ~/

#Get Vim bundle manager
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Get all vim extensions and place them in bundle repo
cd ~/.vim/bundle/
while read p; do
    if [[ $p == *"git"* ]]
    then
        git clone $p
    elif [[ $p != "" ]]
    then
        echo -e "\nCloning a repo allowing : "$p"\n"
    fi
done <$vimBundleFile

##Vim Colors
#cd 
mkdir ~/.vim/colors
cd /tmp
git clone "https://github.com/flazz/vim-colorschemes.git"
cp ./vim-colorschemes/colors/* ~/.vim/colors/
cd
