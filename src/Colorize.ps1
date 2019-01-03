#Colorize output of command
# use like: somecommand | colorize
function Colorize {
    [CmdletBinding()]
    param([Parameter(ValueFromPipeline, Mandatory)]$inp)
    begin{
        $colorSelect = $true
        [System.ConsoleColor]$color = [System.ConsoleColor]::Green
    }
    process{
        foreach($item in $inp){
            if($colorSelect){$color = [System.ConsoleColor]::White}
            else {$color = [System.ConsoleColor]::Cyan}
            $colorSelect = !$colorSelect
            write-host $item -ForegroundColor $color
        }
    }
}