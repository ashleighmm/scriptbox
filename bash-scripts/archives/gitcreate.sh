#!/bin/bash

# https://gist.github.com/robwierzbowski/5430952/
# Create and push to a new github repo from the command line.  
# Grabs sensible defaults from the containing folder and `.gitconfig`.  
# Refinements welcome.

# Gather constant vars
CURRENTDIR=${PWD##*/}
GITHUBUSER=$(git config github.user)

REPONAME


# Get user input
echo "Enter your remote Repository url: ";
read GITREPO;
echo "Enter the your Github username: ";
read GITHUBUSER;
echo "Enter a description for your repo: ";
read DESCRIPTION;

##Removed this from ref source and
#read "REPONAME?New repo name (enter for ${PWD##*/}):"
#read "USER?Git Username (enter for ${GITHUBUSER}):"
#read "DESCRIPTION?Repo Description:"

echo "###Creating Github live Repo..."

#git create $GITREPO
git init
git remote add origin "http://github.com/$GITHUBUSER/$GITREPO.git"

# Curl some json to the github API
#curl -u ${USER:-${GITHUBUSER}} https://api.github.com/user/repos -d "{\"name\": \"${REPONAME:-${CURRENTDIR}}\", \"description\": \"${DESCRIPTION}\", \"private\": false, \"has_issues\": true, \"has_downloads\": true, \"has_wiki\": false}"

# Set the freshly created repo to the origin and push
# You'll need to have added your public key to your github account
#git remote set-url origin git@github.com:${USER:-${GITHUBUSER}}/${REPONAME:-${CURRENTDIR}}.git
git push --set-upstream origin master
