# SPHINX docs
function Start-SphinxLoopBuild([System.Int32]$timeout){
    while($true){
        .\make html
        Write-Host
        Write-Host @"
=========================
Ready and waiting......
=========================
"@ -ForegroundColor Green
        Write-Host
        [System.Threading.Thread]::Sleep($timeout);
        cls
        Write-Host "Awaiting shpinx..." -ForegroundColor Cyan
    }
}