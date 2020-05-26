<#
************************************************************************

This file is part of the Buildings and Habitats object Model (BHoM)
continuous integration and automated build processes 

For more information see https://github.com/BHoM/build-scripts/README.md
and https://bhom.xyz

************************************************************************
#>


# Set Global Config file paths and parameters
& "$PSScriptRoot\Config.ps1"


$subDir = Get-ChildItem $bhomgitPath | Where-Object {$_.PSIsContainer};

foreach($sub in $subDir)
{
    cd $sub.FullName 
    Write-Host "`n****`nPULL $sub"
    git pull
}
