# Overrides prompt

function prompt {
    $p = Split-Path -leaf -path (Get-Location)
    if((pwd).Path.Length -eq 3) {"$p> "}
    else {"~/$p> "}
}