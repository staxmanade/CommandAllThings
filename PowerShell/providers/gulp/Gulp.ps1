function Where-Lookup-Command(){ where.exe $args }

@{
    "invoke"= {
            $cmd = (Where-Lookup-Command gulp | select-string ".(bat|cmd)$")
            & $cmd @args
        };
    "isProject" = {
            return test-path "./gulpfile.js";
        };
    "hasCommand" = {
        if( (Where-Lookup-Command gulp | measure).Count ) {
            return $true;
        } else {
            return $false;
        }
    };
}
