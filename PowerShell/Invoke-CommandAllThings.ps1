$here = Split-Path -Parent $MyInvocation.MyCommand.Path

function Where-Lookup-Command(){ where.exe $args }


function Get-CommandAllThingsProviders {

    $result = @{}

    $providers = ls -recurse "$here\providers" -Exclude "*.Tests.ps1" | where { !$_.PSIsContainer }
    $providers | %{
        $name = $_['name']
        if(!$name) {
            $name = [System.IO.Path]::GetFileNameWithoutExtension($_)
        }
        $result[$name] = & $_
    }
    $result
}

$providers = $null;


function Invoke-CommandAllThings {

    # TODO: it looks like caching but "$providers = ..." sets the local variable
    if(!$providers){
        $providers = Get-CommandAllThingsProviders;
    }

    foreach($key in $providers.Keys) {
        # $Provider is exposed for providers
        $Provider = $providers[$key]
        if( (& $Provider.isProject) ) {
            Invoke-Command -scriptblock $Provider.invoke -ArgumentList $args
            return
        }
    }

    throw "CommandAllThings: Could not find a known task file (ex: gruntfile.js, gulpfile.js, jakefile, makefile, or rakefile)"
}
