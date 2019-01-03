# Overrides prompt

function prompt {
    $Host.UI.RawUI.BackgroundColor = ($bckgrnd = 'Black')
    $p = Split-Path -leaf -path (Get-Location)
    if((pwd).Path.Length -eq 3) {"$p> "}
    else {"~/$p> "}
}