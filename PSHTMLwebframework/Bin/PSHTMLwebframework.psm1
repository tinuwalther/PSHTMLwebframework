<#
    Generated at 01/17/2020 17:29:02 by Martin Walther
#>
#region namespace PSHTMLwebframework

function New-WEBPage{

    <#

        .SYNOPSIS
        Enter the synopsis of this function

        .DESCRIPTION
        Enter the description of this function

        .PARAMETER newpage
        Enter the name of the new page

        .EXAMPLE
        New-WEBPage -newpage Page1, Page2, Page3

        .NOTES
        Date, Author, Version, Notes

    #>

    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false)]
        [String[]]$newpage
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

        $newpage | ForEach-Object {
            Copy-Item -Path "$($PSTemplatePath)\page.html.ps1" -Destination "$($PSBinPath)\$($_).html.ps1" -PassThru | Select-Object -ExpandProperty FullName
            $Label = (Get-Culture).TextInfo.ToTitleCase($_.ToLower())
            $Menue = @"
li -class "nav-item" -content {

    a -class "nav-link" -href "$($_).html" -content {
        "$($Label)"
    }

}

"@
            Add-Content -Path "$($PSBinPath)\Includes\navbar.ps1" -Value $Menue -PassThru
        }

        Write-Host "[NEW] [END ] Process" -ForegroundColor Green	

        $ret = [PSCustomObject]@{
            Succeeded  = $true
            Function   = $function
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

function Publish-WEBHtmlPages{

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

        Write-Host "[BUILD] [START] Launching Build Process" -ForegroundColor Green	

        $PSScripts = (Get-ChildItem -Path $PSBinPath -Filter '*.html.ps1') 
        $PSScripts | ForEach-Object {
            powershell.exe -File $($_.FullName)
        }

        Get-ChildItem -Path $HTMLRoot -Filter '*.html'

        Write-Host "`n[BUILD] [END ] Build Process" -ForegroundColor Green	

        $ret = [PSCustomObject]@{
            Succeeded  = $true
            Function   = $function
            Message    = "Html Pages successfully builded"
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
#endregion
