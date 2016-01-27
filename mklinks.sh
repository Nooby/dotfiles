#!/bin/bash

declare -a files=(bin .gitconfig .gitignore .i3 .janus .oh-my-zsh .vimrc.after .vimrc.before .xinitrc .xprofile .Xresources .zshrc .config/awesome .config/herbstluftwm  .config/bspwm .config/screen-lock.png .config/sxhkd .config/systemd)
echo -e "\e[1;32mThis script will create the following symlinks:\e[00m\n"

for curr in "${files[@]}"
do
	echo -e "$PWD/$curr -> ~/$curr"
done

valinput=0
while [ $valinput -ne 1 ]
do
	echo -en "\n\e[1;32mContinue? [y/N]\e[00m "
	read choice
	case "$choice" in
		"y" ) 
			valinput=1
			cont=1;;
		"Y" )
			valinput=1
			cont=1;;
		"n" )
			valinput=1
			cont=0;;
		"N" )
			valinput=1
			cont=0;;
		"" ) 
			valinput=1
			cont=0;;
		"clean" )
			valinput=1
			cont=2;;
		* )
			valinput=0;;
	esac
done

if [ $cont -eq 2 ]
then
	echo "Cleaning Home Directory.\n"
	for curr in "${files[@]}"
	do
		rm -f `echo ~/$curr`
		echo -e "~/$curr"
	done
fi

if [ $cont -eq 1 ]
then
	echo "Installing DotFiles.\n"
	for curr in "${files[@]}"
	do
		rm -f `echo ~/$curr`
		ln -fs `echo $PWD/$curr` `echo ~/$curr`
		echo -e "$PWD/$curr -> ~/$curr"
	done
fi
