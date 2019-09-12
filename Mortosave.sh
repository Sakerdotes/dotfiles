#!/bin/sh 

# === Calculate scriptpath

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

# === Functions

collect_config() {
	echo "collect i3 conf"
		cp -r ~/.i3/config $SCRIPTPATH/i3/config  
		echo "collect termite conf"
		cp -r ~/.config/termite $SCRIPTPATH/  
		echo "collect nvim conf"
		cp -r ~/.config/nvim $SCRIPTPATH/  
		echo "collect comption conf"
		cp -r ~/.config/compton.conf $SCRIPTPATH/compton/compton.conf  
		echo "Finished collecting the whole config!"
}

apply_config() {
	echo "apply i3 conf"
		cp -r $SCRIPTPATH/i3/config ~/.i3/config
		echo "apply termite conf"
		cp -r $SCRIPTPATH/termite ~/.config/
		echo "apply nvim conf"
		cp -r $SCRIPTPATH/nvim ~/.config/
		echo "apply comption conf"
		cp -r $SCRIPTPATH/compton/compton.conf ~/.config/compton.conf
		echo "Finished applying the whole config!"
}


echo "Mortosave: The best config saving tool EVER!"
echo "Choose Option:"
echo "  Update(u): Will collect all needed config files from filesystem."
echo "  Apply(a): Will apply all config files in from this collection to the right places."

read option
echo ""

if [ "$option" = "u" ]; then
echo "Start collecting configs"
collect_config
elif [ "$option" = "a" ]; then
echo "Start applying configs"
apply_config
else
echo "Scheesh try again ;-)"
fi


