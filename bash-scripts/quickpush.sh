#!/bin/bash
### Quick Git commit and push all files in website directory
## Written by Ashleigh & Junayd

## Display the status of changed / untracked files from current directory
git status

## Press enter to continue to commit and push
read -p "Press enter to stage all files in this directory: []"

## Stage all untracked files from local repo
git add -A
## Check if git add was successful
  if (( $? )); then
      echo "Unable to stage files"
      exit 1
  fi

## Request a commit message for the staged items
echo "Enter your commit message: []";
read COMMIT_MESSAGE;
  git commit -m "$COMMIT_MESSAGE"
## Check if git commit was successful
  if (( $? )); then
      echo "Unable to create the commit"
      exit 1
  fi

## Press enter to push commited files to Github remote repo associated with this directory. 
read -p "Press enter to push to Github remote repo: []"
## Push the content to the master branch on Github repo
## Check if git push was successful
git push origin master
  if (( $? )); then
      echo "Unable to push to Github remote repo"
      exit 1
  else
## If successful, print:
echo "Pushed to remote repo successfuly!"
fi

## Check the status again to mae sure the working tree is clean
git status
exit 0
