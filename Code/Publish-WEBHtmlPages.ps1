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
        [String]$WebsiteTitle = "PSHTML Webexample",

        [ValidateSet("fixed width","full width")]
        [Parameter(Mandatory = $false)]
        [String]$ContainerStyle = "fixed width"
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
            if($PSVersionTable.PSVersion.Major -lt 6){
                . (Join-Path -Path $psHome -ChildPath 'powershell.exe') -File $($_.FullName) -WebsiteTitle $WebsiteTitle -ContainerStyle $ContainerStyle
            }else{
                if($IsWindows){
                    . (Join-Path -Path $psHome -ChildPath 'pwsh.exe') -File $($_.FullName) -WebsiteTitle $WebsiteTitle -ContainerStyle $ContainerStyle
                }else{
                    . (Join-Path -Path $psHome -ChildPath 'pwsh') -File $($_.FullName) -WebsiteTitle $WebsiteTitle -ContainerStyle $ContainerStyle
                }
            }    
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
