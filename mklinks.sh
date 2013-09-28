EXCLUDE='\.git|\.config|mklinks\.sh|README|misc|\.swp$'
fcount=`find . -maxdepth 1 -mindepth 1 | grep -vP $EXCLUDE | wc -l`
dcount=`find .config -maxdepth 1 -mindepth 1 -type d | wc -l`
echo -e "\e[1;32mThis script will create the following symlinks:\e[00m"

for (( i=1; i<=$dcount; i++ ))
do
	curr=`find .config -maxdepth 1 -mindepth 1 -type d | head -n $i | tail -n 1`
	echo -e "~/$curr/ -> $PWD/$curr/"
done

for (( i=1; i<=$fcount; i++ ))
do
	curr=`find . -maxdepth 1 -mindepth 1 | grep -vP $EXCLUDE | head -n $i | tail -n 1 | cut -c 3-`
	echo -e "~/$curr -> $PWD/$curr"
done

echo -e "$PWD/misc/vim-pathogen/autoload/pathogen.vim -> $PWD/.vim/autoload/pathogen.vim"

valinput=0
while [ $valinput -ne 1 ]
do
	echo -en "\e[1;32mContinue? [y/N]\e[00m "
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
		* )
			valinput=0;;
	esac
done

if [ $cont -eq 1 ]
then
	for (( i=1; i<=$dcount; i++ ))
	do
		curr=`find .config -maxdepth 1 -mindepth 1 -type d | head -n $i | tail -n 1`
		rm -f `echo ~/$curr`
		ln -s `echo $PWD/$curr` `echo ~/$curr`
	done

	for (( i=1; i<=$fcount; i++ ))
	do
		curr=`find . -maxdepth 1 -mindepth 1 | grep -vP $EXCLUDE | head -n $i | tail -n 1 | cut -c 3-`
		rm -f `echo ~/$curr`
		ln -s `echo $PWD/$curr` `echo ~/$curr`
	done
fi

mkdir -p `echo $PWD/.vim/autoload`
rm -f `echo $PWD/.vim/autoload`
ln -s `echo $PWD/misc/vim-pathogen/autoload/pathogen.vim` `echo $PWD/.vim/autoload/pathogen.vim`

