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

function Install-FSharpDotnetTemplates {
    Install-DotNetTemplateById("WebAPI.FSharp.Template::*")
    Install-DotNetTemplateById("Eto.Forms.Templates::*")
    Install-DotNetTemplateById("Expecto.Template::*")
    Install-DotNetTemplateById("Fable.Template.Elmish.React::*")
    Install-DotNetTemplateById("Fable.Template::*")
    Install-DotNetTemplateById("Fable.Template.Library::*")
    Install-DotNetTemplateById("Freya.Template::*")
    Install-DotNetTemplateById("giraffe-template::*")
    Install-DotNetTemplateById("GtkSharp.Template.FSharp")
    Install-DotNetTemplateById("MiniScaffold::*")
    Install-DotNetTemplateById("NancyFx.Core.Template::*")
    Install-DotNetTemplateById("BlackFox.DotnetNew.FSharpTemplates::*")
    Install-DotNetTemplateById("WebSharper.Templates::*")
    Install-DotNetTemplateById("SAFE.Template::*")
    Install-DotNetTemplateById("FSharp.TypeProviders.Templates")
}

function Install-CSharpDotnetTemplates {
    Install-DotNetTemplateById("Microsoft.AspNetCore.Blazor.Templates::*")
    Install-DotNetTemplateById("GtkSharp.Template.CSharp")
    Install-DotNetTemplateById("MonoGame.Template.CSharp")
    Install-DotNetTemplateById("NUnit3.DotNetNew.Template::*")
    Install-DotNetTemplateById("FiftyProtons.Templates.PSCore::*")
    Install-DotNetTemplateById("RaspberryPi.Template::*")
    Install-DotNetTemplateById("FiftyProtons.Templates.DotNetNew::*")
}

function Install-DotnetTemplates {
    Install-FSharpDotnetTemplates
    Install-CSharpDotnetTemplates    
}

new-alias codecomp Invoke-VSCodeCompare
