## Organise files by filetype into correct folders
foreach ($item in Get-ChildItem | Where-Object Extension -In ".jpg", ".gif", ".png", ".jpeg", ".svg" ) {
    if (!(Test-Path images)) {
        new-item -Name images -ItemType directory
    }
    Move-Item $item.FullName images
}

foreach ($item in Get-ChildItem | Where-Object Extension -In ".otf", ".ttf", ".woff", ".woff2" ".eot") {
    if (!(Test-Path fonts)) {
        new-item -Name fonts -ItemType directory
    }
    Move-Item $item.FullName fonts
}

foreach ($item in Get-ChildItem | Where-Object Extension -In ".js") {
    if (!(Test-Path js)) {
        new-item -Name js -ItemType directory
    }
    if (!($item.name -like "gulpfile.js")) {
        Move-Item $item.FullName js
    }
}

foreach ($item in Get-ChildItem | Where-Object Extension -In ".css") {
    if (!(Test-Path css)) {
        new-item -Name css -ItemType directory
    }
    Move-Item $item.FullName css
}

foreach ($item in Get-ChildItem | Where-Object Extension -In ".sass") {
    if (!(Test-Path sass)) {
        new-item -Name sass -ItemType directory
    }
    Move-Item $item.FullName sass
}