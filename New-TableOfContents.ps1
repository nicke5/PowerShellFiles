<#
.SYNOPSIS
 Creates a table of contents.
.DESCRIPTION
 Creates a table of contents of all files within a given path. Displays in raw HTML format.
.PARAMETER path
.EXAMPLE
 New-TableOfContents(C:\users\nick\)
#>
	
function New-TableOfContents{
 
param(
		[string]$path,
		[string]$TOCName = "Example TOC"
		)
		 
			"Checking to see if path exists"
		  	if(Test-Path $path)  
			
			{
		    $root = (Get-Item $path).FullName

		    Write-Output "<html><head><title>$TOCName</title></head><body><h1>$TOCName</h1>"
		 
		    Get-ChildItem $root -recurse | where { $_.PSIsContainer -eq $false } |% {
		        
		        $fullPath = $_.FullName 
				$relPath = $_.FullName.Remove(0, $root.Length + 1)
		        
				Write-Output "<a href=`"$fullPath`">$relPath</a><br />"
		    }
		    Write-Output "</body></html>"
			}
			else
			{
			Write-Warning "Failed to find or verify $path"
			}
		
 

}