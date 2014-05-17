function Where-Lookup-Command(){ where.exe $args }

@{
    "invoke"= {
            $cmd = (Where-Lookup-Command grunt | select-string ".(bat|cmd)$")
            & $cmd @args
        };
    "isProject" = {
            return test-path "./gruntfile.js";
        };
    "hasCommand" = {
        if( (Where-Lookup-Command grunt | measure).Count ) {
            return $true;
        } else {
            return $false;
        }
    };
}
