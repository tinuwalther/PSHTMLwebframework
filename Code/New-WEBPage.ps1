
function New-WEBPage{

    <#

        .SYNOPSIS
        Enter the synopsis of this function

        .DESCRIPTION
        Enter the description of this function

        .PARAMETER Param1
        Enter the description of the Param1

        .EXAMPLE
        Get-SomeSettings.ps1 -Param1 'run'

        .NOTES
        Date, Author, Version, Notes

    #>

    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false)]
        [String]$Param1
    )
    $function = $($MyInvocation.MyCommand.Name)
    Write-Verbose "Running $function"

    $ret = [PSCustomObject]@{
        Succeeded  = $false
        Function   = $function
        Message    = 'Not found'
    }

    try{

        Write-Host "[NEW] [START] Launching new page process" -ForegroundColor Green	

        $newpage = Read-Host 'Enter the name of the new page'

        Copy-Item -Path "$($PSTemplatePath)\page.ps1" -Destination "$($PSBinPath)\$($newpage).ps1" -PassThru | Select-Object -ExpandProperty FullName

        Write-Host "[NEW] [END ] Process" -ForegroundColor Green	

        $ret = [PSCustomObject]@{
            Succeeded  = $true
            Function   = $function
            Message    = "$($newpage)s successfully created"
        }

    }
    catch{
        $ret = [PSCustomObject]@{
            Succeeded  = $false
            Function   = $function
            Activity   = $($_.CategoryInfo).Activity
            Message    = $($_.Exception.Message)
            Category   = $($_.CategoryInfo).Category
            Exception  = $($_.Exception.GetType().FullName)
            TargetName = $($_.CategoryInfo).TargetName
        }
        #don't forget to clear the error-object
        $error.Clear()
    }
    return $ret
}

<# 
=====================================================

        FUNCTION SPLITTER

=====================================================
#>
