<#
************************************************************************

This file is part of the Buildings and Habitats object Model (BHoM)
continuous integration and automated build processes 

For more information see https://github.com/BHoM/build-scripts/README.md
and https://bhom.xyz

************************************************************************
#>

# Set local folder for BHoM Toolkit source code
$Global:bhomgitPath = "C:\BHoMGitHub"

# Set the location of MSBuild.exe to enable automated build process. See README for more info.
$Global:msbuildPath = "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin\MSBuild.exe"

# Set the location of NuGet.exe to enable automated restore and update of NuGet packages. See README for more info.
$Global:nugetPath = "C:\Program Files (x86)\NuGet\NuGet.exe"

# Set names and build order for repository list files. See README for more info.
$Global:repos = @(  "core",
                    "utility", 
                    "toolkits",
                    "ui"
                 )   