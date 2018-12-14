#!/bin/bash
# Scriptacular - gitinit.sh
# Initialize a directory with git, stage and commit existing files
# Copyright 2013 Christopher Simpkins
# MIT License

FILE_TYPE="."
INITIAL_COMMIT_MESSAGE="Initial commit"

## Git Install ##
echo '###Installing Git...'
sudo apt-get install git -y

## Git configuration
echo '###Configure Git..'

echo "Enter the global username for Git:";
read GITUSER;
git config --global user.name "${GITUSER}"

echo "Enter the Global Email for Git:";
read GITEMAIL;
git config --global user.email "${GITEMAIL}"

echo 'Git has been configured!'
git config --list

#Check if there is an existing a .git directory
if [ -d ".git" ]; then
  echo "This directory has already been initialized with git."
  exit 1
else
  git init
##Check if git init was successful
  if (( $? )); then
      echo "Unable to initialize your directory"
      exit 1
  fi
  git add "$FILE_TYPE"
##Check if git add was successful
  if (( $? )); then
      echo "Unable to stage files"
      exit 1
  fi
  git commit -m "$INITIAL_COMMIT_MESSAGE"
##Check if git commit was successful
  if (( $? )); then
      echo "Unable to create the initial commit"
      exit 1
  fi
  touch README.md
  touch .gitignore
  echo " ----- "
  echo "The directory was initialized and an initial commit was performed with the files matching the pattern '$FILE_TYPE'"
fi
echo "Enter your remote Repository name: ";
read GITREPO;
git remote add origin https://github.com/$GITUSER/$GITREPO.git
git push -u origin master
#git remote set-url origin git@github.com/$GITUSER/$GITREPO.git
if (( $? )); then
echo "Unable to set remote repo"
fi
exit 1
exit 0
