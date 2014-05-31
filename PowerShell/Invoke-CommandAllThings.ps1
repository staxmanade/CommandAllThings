$here = Split-Path -Parent $MyInvocation.MyCommand.Path

function Get-CommandAllThingsProviders {

    $result = @{}

    $providers = ls -recurse "$here\providers" -Exclude "*.Tests.ps1" | where { !$_.PSIsContainer }
    $providers | %{
        $name = [System.IO.Path]::GetFileNameWithoutExtension($_);
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
        throw "CommandAllThings: Could not find a known task file (ex: gruntfile.js, gulpfile.js, jakefile, makefile, or rakefile)"
    }

}
