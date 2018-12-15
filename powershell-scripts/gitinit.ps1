
$FILE_TYPE="."
$INITIAL_COMMIT_MESSAGE="Initial commit"

## Git configuration
Write-Host "###Configure Git.."

$GITUSER = Read-Host -Prompt "Enter the global username for Git:"
git config --global --replace-all user.name $GITUSER
git config --global user.name

$GITEMAIL = Read-Host -Prompt "Enter the Global Email for Git:"
git config --global --replace-all user.email $GITEMAIL
git config --global user.email 

Write-Host "Git has been configured!"
git config --list

#Check if there is an existing a .git directory
If(Test-Path .git) {
 Write-Host "This directory has already been initialized with git."
} Else { git init }
##Check if git init was successful
If( $? ) {
  Write-Host "Unable to initialize your directory"
}

git add $FILE_TYPE
##Check if git add was successful
If( $? ) {
  Write-Host "Unable to stage files"
}
git commit -m "$INITIAL_COMMIT_MESSAGE"
##Check if git commit was successful
If( $? ) {
  Write-Host "Unable to create the initial commit"
}
New-Item -ItemType file README.md
New-Item -ItemType file .gitignore
Write-Host " ----- "
Write-Host "The directory was initialized and an initial commit was performed with the files matching the pattern '$FILE_TYPE'"

$GITREPO = Read-Host -Prompt " your remote Repository url: "
git remote add origin https://github.com/$GITUSER/$GITREPO.git
git push -u origin master
git remote set-url origin git@github.com/$GITUSER/$GITREPO.git
If( $? ){
  Write-Host "Unable to set remote repo"
}
