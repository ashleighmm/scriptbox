### Quick Git commit and push all files in website directory
## Written by Ashleigh & Junayd

## Display the status of changed / untracked files from current directory
git status

## Press enter to continue to commit and push
Read-Host -Prompt "Press enter to stage all files in this directory or CTRL+C to quit"

## Stage all untracked files from local repo
git add -A
## Check if git add was successful
If( $? ) {
  Write-Host "Unable to stage files"
}

## Request a commit message for the staged items
$COMMIT_MESSAGE = Read-Host -Prompt "Enter your commit message"
git commit -m "$COMMIT_MESSAGE"

## Check if git commit was successful
If( $? ) {
  Write-Host "Unable to create the commit"
}

## Press enter to push commited files to Github remote repo associated with this directory. 
Read-Host -Prompt "Press enter to push to Github remote repo or CTRL+C to quit"

## Push the content to the master branch on Github repo
## Check if git push was successful
git push origin master
If( $? ) {
  Write-Host "Unable to push to Github remote repo"
}
Else {
Write-Host "Pushed to remote repo successfuly!"
}

## Check the status again to mae sure the working tree is clean
git status

