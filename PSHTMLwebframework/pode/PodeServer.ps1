<#
.SYNOPSIS
    Start Pode server

.DESCRIPTION
    Test if it's running on Windows, then test if it's running with elevated Privileges, and start a new session if not.

.LINK
    Specify a URI to a help page, this will show when Get-Help -Online is used.

.EXAMPLE
    Start-PodeServer.ps1 -Verbose
#>
[CmdletBinding()]
param ()

#region functions
function Test-IsElevated {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [OSType]$OS
    )

    Write-Verbose $('[', (Get-Date -f 'yyyy-MM-dd HH:mm:ss.fff'), ']', '[ Begin   ]', "$($MyInvocation.MyCommand.Name)" -Join ' ')
    if($OS -eq [OSType]::Windows){
        $user = [Security.Principal.WindowsIdentity]::GetCurrent()
        $ret  = (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
    }elseif($OS -eq [OSType]::Mac){
        $ret = ((id -u) -eq 0)
    }

    Write-Verbose $ret
    Write-Verbose $('[', (Get-Date -f 'yyyy-MM-dd HH:mm:ss.fff'), ']', '[ End     ]', "$($MyInvocation.MyCommand.Name)" -Join ' ')
    return $ret
}

function Set-HostEntry{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [String] $Name,

        [Parameter(Mandatory=$false)]
        [Switch]$Elevated
    )

    Write-Verbose $('[', (Get-Date -f 'yyyy-MM-dd HH:mm:ss.fff'), ']', '[ Begin   ]', "$($MyInvocation.MyCommand.Name)" -Join ' ')

    $PsNetHostsTable = Get-PsNetHostsTable
    if($PsNetHostsTable.ComputerName -contains $Name){
        $ret = $true
    }else{
        if($Elevated) {
            Write-Host "Try to add $($Name) to hosts-file" -ForegroundColor Green
            Add-PsNetHostsEntry -IPAddress 127.0.0.1 -Hostname $($Name) -FullyQualifiedName "$($Name).local"
        }else{
            Write-Host "Try to add $($Name) to hosts-file need elevated Privileges" -ForegroundColor Yellow
            $ret = $false
        }
    }
    Write-Verbose $(($PsNetHostsTable | Where-Object ComputerName -match $($Name)) | Out-String)

    Write-Verbose $('[', (Get-Date -f 'yyyy-MM-dd HH:mm:ss.fff'), ']', '[ End     ]', "$($MyInvocation.MyCommand.Name)" -Join ' ')

    return $ret
}

function Set-PodeRoutes {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$false)]
        [Switch]$index,
        
        [Parameter(Mandatory=$false)]
        [Switch]$blog,
        
        [Parameter(Mandatory=$false)]
        [Switch]$about,
        
        [Parameter(Mandatory=$false)]
        [Switch]$process,
        
        [Parameter(Mandatory=$false)]
        [Switch]$service
        
    )

    Write-Verbose $('[', (Get-Date -f 'yyyy-MM-dd HH:mm:ss.fff'), ']', '[ Begin   ]', "$($MyInvocation.MyCommand.Name)" -Join ' ')

    # the "GET /login" endpoint for the login page
    Add-PodeRoute -Method Get -Path '/login' -Authentication 'Login' -Login -ScriptBlock {
        Write-PodeViewResponse -Path 'login.pode' -FlashMessages
    }

    # the "POST /login" endpoint for user authentication
    Add-PodeRoute -Method Post -Path '/login' -Authentication 'Login' -Login
    
    # Must be defined also in the navbar.ps1
    if($index){
        Add-PodeRoute -Method Get -Path '/' -Authentication 'Login' -ScriptBlock {
            # increase the session view
            $WebEvent.Session.Data.Views++

            Write-PodeViewResponse -Path 'index.pode' -Data @{
                Username = $WebEvent.Auth.User.Name;
                Views    = $WebEvent.Session.Data.Views;
            } # for PowerShell Code inside the page, the extension must be .pode
        }
    }

    if($blog){
        Add-PodeRoute -Method Get -Path '/blog' -Authentication 'Login' -ScriptBlock {
            Write-PodeViewResponse -Path 'blog.html'
        }    
    }

    if($about){
        Add-PodeRoute -Method Get -Path '/about' -Authentication 'Login' -ScriptBlock {
            Write-PodeViewResponse -Path 'about.html'
        }    
    }

    if($process){
        Add-PodeRoute -Method Get -Path '/process' -Authentication 'Login' -ScriptBlock {
            Write-PodeViewResponse -Path 'process.html'
        }    
    }

    if($service){
        Add-PodeRoute -Method Get -Path '/service' -Authentication 'Login' -ScriptBlock {
            Write-PodeViewResponse -Path 'service.html'
        }    
    }

    Write-Verbose $('[', (Get-Date -f 'yyyy-MM-dd HH:mm:ss.fff'), ']', '[ End     ]', "$($MyInvocation.MyCommand.Name)" -Join ' ')

}
#endregion

#region Main
enum OSType {
    Linux
    Mac
    Windows
}

if($PSVersionTable.PSVersion.Major -lt 6){
    $CurrentOS = [OSType]::Windows
}else{
    if($IsMacOS)  {$CurrentOS = [OSType]::Mac}
    if($IsLinux)  {$CurrentOS = [OSType]::Linux}
    if($IsWindows){$CurrentOS = [OSType]::Windows}
}
#endregion

#region Pode server
if($CurrentOS -eq [OSType]::Windows){
    if(Test-IsElevated -OS $CurrentOS) {
        $null = Set-HostEntry -Name 'pspode' -Elevated
        Start-PodeServer -Threads 2 -ScriptBlock {
            Write-Host "Running on Windows with elevated Privileges since $(Get-Date)" -ForegroundColor Red
            Write-Host "Press Ctrl. + C to terminate the Pode server" -ForegroundColor Yellow

            Add-PodeEndpoint -Address * -Port 5989 -Protocol Http -Hostname 'pspode'

            #New-PodeLoggingMethod -File -Name 'requests' -MaxDays 4 | Enable-PodeRequestLogging
            New-PodeLoggingMethod -Terminal | Enable-PodeErrorLogging

            # set the view engine
            Set-PodeViewEngine -Type Pode

            # setup session details
            Enable-PodeSessionMiddleware -Duration 120 -Extend

            # setup form authentication
            New-PodeAuthScheme -Form | Add-PodeAuth -Name 'Login' -FailureUrl '/login' -SuccessUrl '/' -ScriptBlock {
                param($username, $password)

                # here you'd check a real user storage, this is just for example
                if ($username -eq 'mwalther' -and $password -eq 'strong') {
                    return @{
                        User = @{
                            ID ='M0R7Y302'
                            Name = 'Tinu'
                            Type = 'Human'
                        }
                    }
                }

                # aww geez! no user was found
                return @{ Message = 'Invalid details supplied' }
            }

            # the "GET /" endpoint for the homepage
            Set-PodeRoutes -index -blog -about -process -service
                
        } -RootPath $($PSScriptRoot).Replace('bin','pode')
    }else{
        Write-Host "Running on Windows and start new session with elevated Privileges" -ForegroundColor Green
        if($PSVersionTable.PSVersion.Major -lt 6){
            Start-Process "$psHome\powershell.exe" -Verb Runas -ArgumentList $($MyInvocation.MyCommand.Name)
        }else{
            Start-Process "$psHome\pwsh.exe" -Verb Runas -ArgumentList $($MyInvocation.MyCommand.Name)
        }
    }
}elseif($CurrentOS -eq [OSType]::Mac){
    Start-PodeServer -ScriptBlock {
        if(Test-IsElevated -OS $CurrentOS) {
            $IsRoot = 'with elevated Privileges'
            $null = Set-HostEntry -Name 'pspode' -Elevated
        }else{
            $IsRoot = 'as User'
            $null = Set-HostEntry -Name 'pspode'
        }
        Write-Host "Running on Mac $($IsRoot) since $(Get-Date)" -ForegroundColor Cyan
        Write-Host "Press Ctrl. + C to terminate the Pode server" -ForegroundColor Yellow

        Add-PodeEndpoint -Address * -Port 5989 -Protocol Http -Hostname 'pspode'
        New-PodeLoggingMethod -File -Name 'requests' -MaxDays 4 | Enable-PodeRequestLogging

        Set-PodeRoutes
    
    } -RootPath $($PSScriptRoot).Replace('bin','pode')
}
#endregion