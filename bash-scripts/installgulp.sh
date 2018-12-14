#!/bin/bash

# Install gulp locally in working web directory

echo "Please enter your full website directory path:"
read WEBSITEPATH;

sudo sh -c "cd $WEBSITEPATH && sudo npm rm gulp --save-dev"
sudo sh -c "cd $WEBSITEPATH && sudo npm cache clean"

# Install the latest Gulp CLI tools globally
sudo sh -c "cd $WEBSITEPATH && sudo npm install gulpjs/gulp-cli -g"

# Install Gulp 4 into your project from 4.0 GitHub branch as dev dependency
sudo sh -c "cd $WEBSITEPATH && sudo npm install gulp@next --save-dev"

# Check the versions installed. Make sure your versions are 2.0.1 + or 4.0.0
sudo sh -c "cd $WEBSITEPATH && sudo gulp -v"

echo "Please enter your website name:"
read WEBSITENAME;

### Create a gulpfile.js file in the website directory and copy the contents from the gulpfile.js file in the ScriptBox installation folder.
### Gulp performs mulitple tasks for developers to make use of durung the development phase, in their own local environment. The ### following will be installed:
sudo sh -c "cd $WEBSITEPATH && touch gulpfile.js"
sudo sh -c "cat gulpfile.js > $WEBSITEPATH/gulpfile.js"

### Create a package.json file in the website directory and copy the contents from the package.json file in the ScriptBox installation folder.  When this has been installed, npm install uses it to check which packages and versions it needs to grab from the package manager library on the npm repository online and install them in the current website directory. 
sudo sh -c "cd $WEBSITEPATH && touch package.json"
sudo sh -c "cat package.json > $WEBSITEPATH/package.json"


### Installs necessary packages listed in the package.json file
sudo sh -c "cd $WEBSITEPATH && npm install gulp"
sudo sh -c "cd $WEBSITEPATH && npm install gulp-autoprefixer"
sudo sh -c "cd $WEBSITEPATH && npm install browser-sync"
sudo sh -c "cd $WEBSITEPATH && npm install gulp-sass"
sudo sh -c "cd $WEBSITEPATH && npm install gulp-cssnano"
sudo sh -c "cd $WEBSITEPATH && npm install gulp-prettyerror"
sudo sh -c "cd $WEBSITEPATH && npm install gulp-sourcemaps"
sudo sh -c "cd $WEBSITEPATH && npm install gulp-rename"
sudo sh -c "cd $WEBSITEPATH && npm install gulp-terser"
sudo sh -c "cd $WEBSITEPATH && npm install gulp-eslint"






