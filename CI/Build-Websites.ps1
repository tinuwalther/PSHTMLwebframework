Write-Host "[BUILD] [START] Launching Build Process" -ForegroundColor Green	

#region prepare folders
$Current          = (Split-Path -Path $MyInvocation.MyCommand.Path)
$HTMLRoot         = ((Get-Item $Current).Parent).FullName
$PSSourcePath     = Join-Path -Path $HTMLRoot -ChildPath "Bin"
$CISourcePath     = Join-Path -Path $HTMLRoot -ChildPath "CI"
#endregion

(Get-ChildItem -Path $PSSourcePath -Filter '*.ps1') | ForEach-Object {
    &($_.FullName)

    Get-Item $($_.FullName)
}