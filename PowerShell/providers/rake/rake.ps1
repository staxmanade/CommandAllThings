function Where-Lookup-Command(){ where.exe $args }

@{
    "invoke"= {
            $cmd = (Where-Lookup-Command rake | select-string ".(bat|cmd)$")
            & $cmd @args
        };
    "isProject" = {
            return test-path "./rakefile";
        };
    "hasCommand" = {
        if( (Where-Lookup-Command rake | measure).Count ) {
            return $true;
        } else {
            return $false;
        }
    };
}
