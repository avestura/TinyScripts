function Invoke-VSCodeCompare {
    param ($File1, $File2)
    code -d $File1 $File2
}

function Install-DotNetTemplateById {
    param ($InstallId)
    Write-Host "Downloading ""$InstallId"": " -ForegroundColor Gray -NoNewline
    $i = dotnet new -i $InstallId
    if($i[0].ToString().Contains("error")){
        Write-Host "There seem to be an error in installation process." -ForegroundColor Red -NoNewline
    }
    else {
        Write-Host "Installation command invoked." -NoNewline -ForegroundColor Gray
    }

    Write-Host
}

$fsharpTemplatesToInstall = 
    "WebAPI.FSharp.Template::*",
    "Eto.Forms.Templates::*",
    "Expecto.Template::*",
    "Fable.Template.Elmish.React::*",
    "Fable.Template::*",
    "Fable.Template.Library::*",
    "Freya.Template::*",
    "giraffe-template::*",
    "GtkSharp.Template.FSharp",
    "MiniScaffold::*",
    "NancyFx.Core.Template::*",
    "BlackFox.DotnetNew.FSharpTemplates::*",
    "WebSharper.Templates::*",
    "SAFE.Template::*",
    "FSharp.TypeProviders.Templates",
    "JaggerJo.Avalonia.FuncUI.Templates"
    

$csharpTemplatesToInstall = 
    "Microsoft.AspNetCore.Blazor.Templates::*",
    "GtkSharp.Template.CSharp",
    "MonoGame.Template.CSharp",
    "NUnit3.DotNetNew.Template::*",
    "FiftyProtons.Templates.PSCore::*",
    "RaspberryPi.Template::*",
    "FiftyProtons.Templates.DotNetNew::*"

$allDotnetTemplatesToInstall = $fsharpTemplatesToInstall + $csharpTemplatesToInstall

function Install-DotNetTemplatesByList {
    param ($idList, $activityName)
    $i = 0;
    $idList.ForEach({
        Write-Progress -Activity $activityName -Status ("Installing ""$_""...") -PercentComplete (($i / $idList.Length) * 100)
        Install-DotNetTemplateById($_)
        $i = $i + 1;
    })
    Write-Progress -Activity $activityName -Status ("Finishing...") -PercentComplete 100 -Completed
    Write-Host
    Write-Host "Run ""dotnet new"" to use newly installed templates." -ForegroundColor Green
}

function Install-FSharpDotnetTemplates {Install-DotNetTemplatesByList $fsharpTemplatesToInstall "F# Templates for .NET CLI" }
function Install-CSharpDotnetTemplates {Install-DotNetTemplatesByList $csharpTemplatesToInstall "C# Templates for .NET CLI"}
function Install-DotnetTemplates       {Install-DotNetTemplatesByList $allDotnetTemplatesToInstall "F# and C# Templates for .NET CLI" }

new-alias codecomp Invoke-VSCodeCompare

function  Test-Colors {
    $sampleText = "Some Text"
    Write-Host "$sampleText in Black"       -ForegroundColor Black
    Write-Host "$sampleText in Blue"        -ForegroundColor Blue
    Write-Host "$sampleText in Cyan"        -ForegroundColor Cyan
    Write-Host "$sampleText in DarkBlue"    -ForegroundColor DarkBlue
    Write-Host "$sampleText in DarkCyan"    -ForegroundColor DarkCyan
    Write-Host "$sampleText in DarkGray"    -ForegroundColor DarkGray
    Write-Host "$sampleText in DarkGreen"   -ForegroundColor DarkGreen
    Write-Host "$sampleText in DarkMagenta" -ForegroundColor DarkMagenta
    Write-Host "$sampleText in DarkRed"     -ForegroundColor DarkRed
    Write-Host "$sampleText in DarkYellow"  -ForegroundColor DarkYellow
    Write-Host "$sampleText in Gray"        -ForegroundColor Gray
    Write-Host "$sampleText in Green"       -ForegroundColor Green
    Write-Host "$sampleText in Magenta"     -ForegroundColor Magenta
    Write-Host "$sampleText in Red"         -ForegroundColor Red
    Write-Host "$sampleText in White"       -ForegroundColor White
    Write-Host "$sampleText in Yellow"      -ForegroundColor Yellow

}

function Assert-Parent($parentName) { return (get-process -id $pid).parent.name -eq $parentName }

function Assert-VSCode { return Assert-Parent("Code") }

function Get-GitBranchName { git symbolic-ref --short HEAD }

function Find-CoAlias($alias){
    $refCmd = (get-alias $alias).ReferencedCommand.Name;
    $refCmdWe = [System.IO.Path]::GetFileNameWithoutExtension($refCmd)
    return Get-Alias -Definition $refCmdWe
}
