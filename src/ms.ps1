function ms{
    Write-Host
    for($i = 0; $i -lt 10; $i++){
        Write-Host -NoNewline " ▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉ " -ForegroundColor Red
        Write-Host            " ▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉ " -ForegroundColor Green
    }
    Write-Host
    for($i = 0; $i -lt 10; $i++){
        Write-Host -NoNewline " ▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉ " -ForegroundColor Blue
        Write-Host            " ▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉ " -ForegroundColor Yellow
    }
    Write-Host
    Write-Host "                     Microsoft"
    Write-Host
}