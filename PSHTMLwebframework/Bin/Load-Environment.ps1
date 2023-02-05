
#region prepare folders
$Current         = (Split-Path -Path $MyInvocation.MyCommand.Path)

Set-Location $Current

$Root            = ((Get-Item $Current).Parent).FullName
$HTMLRoot        = $Root
$HTMLAssetsPath  = Join-Path -Path $HTMLRoot -ChildPath "Assets"
$HTMLBlogPath    = Join-Path -Path $HTMLRoot -ChildPath "Blog"
$HTMLStylePath   = Join-Path -Path $HTMLAssetsPath -ChildPath "Style"

$PSBinPath       = Join-Path -Path $HTMLRoot -ChildPath "Bin"
$PSTemplatePath  = Join-Path -Path $PSBinPath -ChildPath "Templates"
#endregion
