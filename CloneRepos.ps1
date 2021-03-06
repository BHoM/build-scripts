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
                
        #Clone repo to local folder
        write-Output ("`n****`nCloning " + $repo + " from https://github.com/" + $org + "/" + $repo + ".git")
        git clone "https://github.com/$org/$repo.git" "$bhomgitPath\$repo"
    }
}