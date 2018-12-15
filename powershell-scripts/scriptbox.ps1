## Create alias' for the Developer ScriptBox shortcut commands, an alias for each script
## Written from scratch by Ashleigh and Junayd

Write-Host "### Installing Developer ScriptBox..."
$ps_script_dir = "$home\Documents\scriptbox"

Write-Host "### Creating aliases..."
## Create aliases for all of our scripts
##Set-Alias -Name gitinit -Value "& $path\gitinit.ps1" -Scope Global
##Set-Alias -Name quickpush -Value "& $path\quickpush.ps1" -Scope Global
##Set-Alias -Name org -Value "& $path\org.ps1" -Scope Global
##Set-Alias -Name ginstall -Value "& $path\installgulp.ps1" -Scope Global
##Set-Alias -Name backup -Value ./backup.ps1 -Scope Global

New-Alias ginstall $ps_script_dir\installgulp.ps1
New-Alias gitinit $ps_script_dir\gitinit.ps1
New-Alias quickpush $ps_script_dir\quickpush.ps1
New-Alias org $ps_script_dir\org.ps1
New-Alias backup $ps_script_dir\backup.ps1

$gitinit = @"
function Gulp_Alias {
    C:\Users\Ashleigh\Documents\scriptbox\installgulp.ps1
}
Set-Alias ginstall Gulp_Alias -Scope "Global"
function Gitinit_Alias {
    C:\Users\Ashleigh\Documents\scriptbox\gitinit.ps1
}
Set-Alias gitinit Gitinit_Alias -Scope "Global"
function QuickPush_Alias {
    C:\Users\Ashleigh\Documents\scriptbox\quickpush.ps1
}
Set-Alias quickpush QuickPush_Alias -Scope "Global"
function Org_Alias {
    C:\Users\Ashleigh\Documents\scriptbox\org.ps1
}
Set-Alias org Org_Alias -Scope "Global"
function Backup_Alias {
    C:\Users\Ashleigh\Documents\scriptbox\backup.ps1
}
Set-Alias backup Backup_Alias -Scope "Global"
"@

$ps_script_dir = "$home\Documents\scriptbox"
Test-Path -Path C:\Users\Ashleigh\Documents\WindowsPowershell\Microsoft.PowerShell_profile.ps1
Set-Content -Path $env:USERPROFILE\Documents\WindowsPowershell\Microsoft.PowerShell_profile.ps1 -Value $gitinit
Get-Content -Path $env:USERPROFILE\Documents\Microsoft.PowerShell_profile.ps1




Write-Host "### ScribtBox installed successfully!"
Get-Alias
## Install Choco in order to install node and npm
##Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

##-NoProfile -ExecutionPolicy unrestricted -Command "(iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))) >$null 2>&1" && SET PATH="%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

## Install node and npm by launching the msi install file in silent mode to avoid a step wizard
.\node-v10.14.2-x64.msi
# Exit existing PowerShell host window


# Launch PowerShell host in new window
#Start-Process PowerShell



