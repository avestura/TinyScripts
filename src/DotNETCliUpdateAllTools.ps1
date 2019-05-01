function Update-DotNET-Tools {
    $hasDotnet = Get-Command "dotnet" -ErrorAction SilentlyContinue

    if($hasDotnet) {
        $toolsRaw = (dotnet tool list -g)
        $itemsCount = $toolsRaw.Count - 2
        for ($i = 2; $i -lt $toolsRaw.Count; $i++) {
            $toolId = $toolsRaw[$i].Remove($toolsRaw[$i].IndexOf(" "))
            Write-Progress -Activity "Updating .NET CLI Global Tools" -Status ("Updting " + $toolId +"...") -PercentComplete ((($i - 2) / $itemsCount) * 100)
            Write-Host ("Updating tool " + $toolId + "...") -ForegroundColor Green

            dotnet tool update $toolId -g
        }
        Write-Progress -Activity "Updating .NET CLI Global Tools" -Status ("Finishing...") -PercentComplete 100 -Completed
        Write-Host "Update command invoked for all tools." -ForegroundColor Green
    }
    else {
        Write-Host ".NET Core CLI (dotnet) is not installed or is not in the path." -ForegroundColor Red
    } 
}
