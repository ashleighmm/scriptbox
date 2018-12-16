## Create alias' for the Developer ScriptBox shortcut commands, an alias for each script
## Written by Ashleigh 

## Install node and npm by launching the msi install file in silent mode to avoid a step wizard
.\node-v10.14.2-x64.msi

Write-Host "### Installing Developer ScriptBox..."

Write-Host "### Creating aliases..."

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

## Save alias functions to profile.ps1 to make them permanent
$ps_script_dir = "$home\Documents\scriptbox"
Test-Path -Path C:\Users\Ashleigh\Documents\WindowsPowershell\Microsoft.PowerShell_profile.ps1
Set-Content -Path $env:USERPROFILE\Documents\WindowsPowershell\Microsoft.PowerShell_profile.ps1 -Value $gitinit
Get-Content -Path $env:USERPROFILE\Documents\Microsoft.PowerShell_profile.ps1


Write-Host "### ScribtBox installed successfully!"
Get-Alias

# Launch PowerShell host in new window
#Start-Process PowerShell