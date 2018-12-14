## Create alias' for the Developer ScriptBox shortcut commands, an alias for each script
## Written from scratch by Ashleigh and Junayd

Write-Host "### Installing Developer ScriptBox..."

Write-Host "### Creating aliases..."
## Create aliases for all of our scripts
Set-Alias -Name gitinit -Value ./gitinit.ps1 -Scope Global
Set-Alias -Name quickpush -Value ./quickpush.ps1 -Scope Global
Set-Alias -Name org -Value ./org.ps1 -Scope Global
Set-Alias -Name ginstall -Value ./installgulp.ps1 -Scope Global
Set-Alias -Name backup -Value ./backup.ps1 -Scope Global

Write-Host "### ScribtBox installed successfully!"
Get-Alias

## Install Choco in order to install node and npm
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "(iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))) >$null 2>&1" && SET PATH="%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

## Install node and npm with the choco command
choco install nodejs

