function Get-Cutime{
    $n =  [System.DateTime]::Now
    $s = [System.TimeSpan]::FromSeconds($n.Second)
    $m = [System.TimeSpan]::FromMinutes($n.Minute)
    $h = [System.TimeSpan]::FromHours($n.Hour)

    $sum = $s + $m + $h
    $total = ($sum.TotalSeconds / 864)

    $thousandTotal = $total * 1000
    $floor = ([System.Int32]([System.Math]::Floor($thousandTotal)))
    
    $kC = [System.Math]::Floor($floor / 1000)
    $hC = [System.Math]::Floor(($floor % 1000) / 100)
    $C = $floor % 100

    Write-Verbose "$kC : $hC : $C"

    ($kC, $hC, $C, $total)   
}

function Show-Cutime{
    while($true) {
        ($kC, $hC, $C, $total) = Get-Cutime
        $totalFormat = $total.ToString("0.00")
        Write-Progress -Activity "Cutime" -Status "$kC : $hC : $C ($totalFormat%)" -PercentComplete $total
        [System.Threading.Thread]::Sleep(500)
    }
}