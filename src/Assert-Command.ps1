function Assert-Command($Command, [bool]$ShowMessage = $true){
    if(Get-Command $Command -ErrorAction SilentlyContinue){
     if($ShowMessage){Write-Host "The command '$($Command)' is available." -ForegroundColor Green}
     return $true
    }
     if($ShowMessage) {Write-Warning "The command '$($Command)' is not available."}
     return $false
}