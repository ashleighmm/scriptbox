#!/bin/bash -i
shopt -s expand_aliases

## Create alias' for the Developer ScriptBox shortcut commands, an alias for each script
## Written from scratch by Ashleigh and Junayd

echo "### Installing Developer ScriptBox..."

chmod 755 gitinit.sh
chmod 755 installnode.sh
chmod 755 quickpush.sh
chmod 755 find.sh
chmod 755 ~/.bashrc
chmod 755 ~/.profile

echo "### Creating aliases..."
## Create PERMANENT aliases for all of our scripts and add them to a file that gets called in .bashrc
#echo -e "alias gitinit='~/Documents/scripts/gitinit.sh'" >> ~/.bash_aliases
#echo -e "alias quickpush='~/Documents/scripts/quickpush.sh'" >> ~/.bash_aliases

## Create variables for aliases and filepath
LINE1="alias gitinit='~/Documents/scripts/gitinit.sh'"
LINE2="alias quickpush='~/Documents/scripts/quickpush.sh'"
LINE3="alias org='~/Documents/scripts/find.sh'"
LINE4="alias install-n='~/Documents/scripts/installnode.sh'"

FILE=~/.bash_aliases
## Use grep (search tool) to add the aliases to .bash_aliases only if they don't already exist
grep -qF -- "$LINE1" "$FILE" || echo "$LINE1" >> "$FILE"
grep -qF -- "$LINE2" "$FILE" || echo "$LINE2" >> "$FILE"
grep -qF -- "$LINE3" "$FILE" || echo "$LINE3" >> "$FILE"
grep -qF -- "$LINE4" "$FILE" || echo "$LINE4" >> "$FILE"

echo "### ScriptBox installed successfully!"
### Reruns bash core files to register new aliases which have now been added to .bash_aliases
. ~/.profile
. ~/.bashrc

exit 1
