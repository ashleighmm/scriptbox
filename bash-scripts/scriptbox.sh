#!/bin/bash -i
shopt -s expand_aliases

## Create alias' for the Developer ScriptBox shortcut commands, an alias for each script
## Written from scratch by Ashleigh More-Hattia and Junayd Khan

echo "### Installing Developer ScriptBox..."

chmod 755 gitinit.sh
chmod 755 installgulp.sh
chmod 755 quickpush.sh
chmod 755 org.sh
chmod 755 backup.sh
chmod 755 ~/.bashrc
chmod 755 ~/.profile

echo "### Creating aliases..."

## Create variables for aliases and filepath
LINE1="alias gitinit='~/Documents/scripts/gitinit.sh'"
LINE2="alias qp='~/Documents/scripts/quickpush.sh'"
LINE3="alias org='~/Documents/scripts/org.sh'"
LINE4="alias gi='~/Documents/scripts/installgulp.sh'"
LINE5="alias backup='~/Documents/scripts/backup.sh'"

FILE=~/.bash_aliases
## Use grep (search tool) to add the aliases to .bash_aliases only if they don't already exist
grep -qF -- "$LINE1" "$FILE" || echo "$LINE1" >> "$FILE"
grep -qF -- "$LINE2" "$FILE" || echo "$LINE2" >> "$FILE"
grep -qF -- "$LINE3" "$FILE" || echo "$LINE3" >> "$FILE"
grep -qF -- "$LINE4" "$FILE" || echo "$LINE4" >> "$FILE"
grep -qF -- "$LINE5" "$FILE" || echo "$LINE5" >> "$FILE"

echo "### ScriptBox installed successfully!"
### Reruns bash core files to register new aliases which have now been added to .bash_aliases
. ~/.profile
. ~/.bashrc

###Script to install node and npm on network user's profile

### Install Node & npm
echo "Installing Node.js and npm";
sudo apt install npm
sudo apt install nodejs
sudo node -v
sudo npm -v

# Uninstall previous Gulp installation and related packages, if any
sudo npm rm gulp -g
sudo npm rm gulp-cli -g
. ~/.profile
. ~/.bashrc
exit 1