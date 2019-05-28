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
    "FSharp.TypeProviders.Templates"

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
