$host.UI.RawUI.WindowTitle = "0xaryan - Powershell Core 6 (x64)"
$PSReadLineOptions = @{
    Colors = @{
        "String" = "#d69d85"
        "Error" = "#fc3e36"
        "Keyword" = "#569cd6"
        "Comment" = "#57a64a"
        "Type" = "#4ec9b0"
        "Number" = "#b5cea8"
        "Operator" = "#b4b4b4"
        "Variable" = "#d7ba7d"
    }
}
Set-PSReadLineOption @PSReadLineOptions
$bckgrnd = [System.ConsoleColor]::Black
$host.UI.RawUI.BackgroundColor = $bckgrnd
$host.PrivateData.DebugBackgroundColor = $bckgrnd
$host.PrivateData.ErrorBackgroundColor = $bckgrnd
$host.PrivateData.VerboseBackgroundColor = $bckgrnd
$host.PrivateData.WarningBackgroundColor = $bckgrnd