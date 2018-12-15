### CONFIGURATION

# git
$git_version = "2.9.2"
$git_url = "https://github.com/git-for-windows/git/releases/download/v$git_version.windows.1/Git-$git_version-64-bit.exe"

# npm packages
$gulp_version = ">=1.2.2 <1.3.0"

# extras
$vsc_exe = "$PSScriptRoot\vsc.exe"
$vsc_url = "https://go.microsoft.com/fwlink/?LinkID=623230"


# activate / desactivate any install
$install_git = $TRUE
$install_gulp = $TRUE
$install_eslint = $TRUE

write-host "`n----------------------------"
write-host " system requirements checking  "
write-host "----------------------------`n"

### require administator rights

if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
   write-Warning "This setup needs admin permissions. Please run this file as admin."     
   break
}


write-host "`n"

### git install

if ($install_git) {
    if (Get-Command git -errorAction SilentlyContinue) {
        $git_current_version = (git --version)
    }

    if ($git_current_version) {
        write-host "[GIT] $git_current_version detected. Proceeding ..."
    } else {
        $git_exe = "$PSScriptRoot\git-installer.exe"

        write-host "No git version dectected"

        $download_git = $TRUE
        
        if (Test-Path $git_exe) {
            $confirmation = read-host "Local git install file detected. Do you want to use it ? [Y/n]"
            if ($confirmation -eq "n") {
                $download_git = $FALSE
            }
        }

        if ($download_git) {
            write-host "downloading the git for windows installer"
        
            $start_time = Get-Date
            $wc = New-Object System.Net.WebClient
            $wc.DownloadFile($git_url, $git_exe)
            write-Output "git installer downloaded"
            write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
        }
        
        write-host "proceeding with git install ..."
        write-host "running $git_exe"
        start-Process $git_exe -Wait
        write-host "git installation done"
    }
}



write-host "Proceeding with the previously installed nodejs version ..."

### npm packages install

write-host "`n----------------------------"
write-host " npm packages installation  "
write-host "----------------------------`n"

if (Get-Command gulp -errorAction SilentlyContinue) {
    $gulp_prev_v = (gulp -v)
}

if ($gulp_prev_v) {
    write-host "[GULP] Gulp is already installed :"
    write-host $gulp_prev_v
    
    $confirmation = read-host "Are you sure you want to replace this version ? [y/N]"
    if ($confirmation -ne "y") {
        $install_gulp = $FALSE
    }
}

if ($install_gulp) {
    write-host "Installing gulp-cli"
    npm install --global gulp-cli@"$gulp_version"
}

if (Get-Command jspm -errorAction SilentlyContinue) {
    $jspm_prev_v = (jspm -v)
}

if ($jspm_prev_v) {
    write-host "[JSPM] jspm is already installed :"
    write-host $jspm_prev_v
    
    $confirmation = read-host "Are you sure you want to replace this version ? [y/N]"
    if ($confirmation -ne "y") {
        $install_jspm = $FALSE
    }
}

if ($install_jspm) {
    write-host "Installing jspm globally"
    npm install --global jspm
}


if (Get-Command eslint -errorAction SilentlyContinue) {
    $eslint_prev_v = (eslint -v)
}

if ($eslint_prev_v) {
    write-host "[ESLINT] eslint is already installed :"
    write-host $eslint_prev_v

    $confirmation = read-host "Are you sure you want to replace this version ? [y/N]"
    if ($confirmation -ne "y") {
        $install_eslint = $FALSE
    }
}

if ($install_eslint) {
    write-host "Installing eslint globally"
    npm install --global eslint
}

### extras

write-host "`n----------------------------"
write-host " extra tools "
write-host "----------------------------`n"

$confirmation = read-host "[VSC] Do you want to install VS Code ? [y/N]"
if ($confirmation -eq "y") {

    $download_vsc = $TRUE

    if (Test-Path $vsc_exe) {
        $confirmation = read-host "Local VS Code install file detected. Do you want to use it ? [Y/n]"
        if ($confirmation -eq "n") {
            $download_vsc = $FALSE
        }
    }

    if ($download_vsc) {
        $start_time = Get-Date
        $wc = New-Object System.Net.WebClient
        $wc.DownloadFile($vsc_url, $vsc_exe)
        write-Output "Visual Studio Code installer downloaded"
        write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
    }

    write-host "starting VSC install ..."
    Start-Process $vsc_exe -Wait
    write-host "VSC installed !"
}

### clean

write-host "`n----------------------------"
write-host " system cleaning "
write-host "----------------------------`n"

$confirmation = read-host "Delete install files ? [y/N]"
if ($confirmation -eq "y") {
    if ($node_msi -and (Test-Path $node_msi)) {
        rm $node_msi
    }
    if ($git_exe -and (Test-Path $git_exe)) {
        rm $git_exe
    }
    if ($vsc_exe -and (Test-Path $vsc_exe)) {
        rm $vsc_exe
    }
}


write-host "Done installing gulp globally!"

# Install gulp locally in working web directory
$WEBSITEPATH = read-host "Please enter your website directory path:"
cd $WEBSITEPATH

Copy-Item -Path "$home\Documents\scriptbox\gulpfile.js" -Destination $WEBSITEPATH
Copy-Item -Path "$home\Documents\scriptbox\package.json" -Destination $WEBSITEPATH



# Remove any old versions of gulp in the directory and then clean the cache
npm rm gulp --save-dev

# Install the latest Gulp CLI tools globally
#npm install gulpjs/gulp-cli -g

# Install Gulp 4 into your project from 4.0 GitHub branch as dev dependency
#npm install gulp@next --save-dev

npm install gulp --save-dev
gulp -v

npm install
npm install gulp-terser

