function Where-Lookup-Command(){ where.exe $args }

@{
    "invoke"= {
            $cmd = (Where-Lookup-Command jake | select-string ".(bat|cmd)$")
            & $cmd @args
        };
    "isProject" = {
            return test-path "./jakefile";
        };
    "hasCommand" = {
        if( (Where-Lookup-Command jake | measure).Count ) {
            return $true;
        } else {
            return $false;
        }
    };
}
