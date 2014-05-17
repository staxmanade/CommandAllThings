$here = Split-Path -Parent $MyInvocation.MyCommand.Path

function Where-Lookup-Command(){ where.exe $args }


function Get-CommandAllThingsProviders {

    $result = @{}

    $providers = ls -recurse "$here\providers" -Exclude "*.Tests.ps1" | where { !$_.PSIsContainer }
    write-host $providers
    $providers | %{
        $name = [System.IO.Path]::GetFileNameWithoutExtension($_);
        write-host $name
        $result[$name] = (& $_);
    }
    $result
}

$providers = $null;


function Invoke-CommandAllThings {

    if(!$providers){
        $providers = Get-CommandAllThingsProviders;
    }

    $wasInvoked = $false

    foreach($key in $providers.Keys) {
        $p = $providers[$key];
        if( (& $p.isProject) ) {
            $wasInvoked = $true
            
            Invoke-Command -scriptblock $p.invoke -ArgumentList $args
            break;
        }
    }

    if(!$wasInvoked) {
        throw "Cannot run task [$args] as local command provider was not found"
    }

}
