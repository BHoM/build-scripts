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

    
ForEach ($file in $repos)
{
    # Read repository information from repo files
	$fullPath =  $PSScriptRoot + "\" + $file + ".txt"
	$repoList = Get-Content $fullPath

	write-Output (	"`n****`n" + "**** ITERATE OVER ALL REPOS IN " + $file + ".txt ****" + "`n****`n" )
					
	ForEach ($item in $repoList) 
	{
        $splitItem = $item.split("/");
        
        $org = $splitItem[0];
        $repo = $splitItem[1];  
        
        # Set build configuration or default to Release 
        If ($splitItem.Count -eq 3) { $config = $splitItem[2] } 
        Else { $config = "Release" }
        
        # Define path for repo solution file
        $slnPath = "$bhomgitPath\$repo\$repo.sln"
     
        # Restore NuGets       
        write-Output ("`n****`nRestore NuGets " + $repo + ".sln`n")
        & $nugetPath restore $slnPath

        # Build .sln using msbuild
        write-Output ("`n****`nBuilding " + $repo + ".sln with " + $config + " config.`n")
        & $msbuildPath -nologo $slnPath /verbosity:minimal /p:Configuration=$config
	}
}

