
#region prepare folders
$Current         = (Split-Path -Path $MyInvocation.MyCommand.Path)

Set-Location $Current

$Root            = ((Get-Item $Current).Parent).FullName
$HTMLRoot        = Join-Path -Path $Root -ChildPath "pode"
$HTMLAssetsPath  = Join-Path -Path $HTMLRoot -ChildPath "public/assets"
$HTMLBlogPath    = Join-Path -Path $HTMLRoot -ChildPath "views"
$HTMLStylePath   = Join-Path -Path $HTMLAssetsPath -ChildPath "style"

$PSBinPath       = Join-Path -Path $Root -ChildPath "bin"
$PSTemplatePath  = Join-Path -Path $PSBinPath -ChildPath "templates"
#endregion
