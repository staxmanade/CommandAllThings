function Where-Lookup-Command {
    return where.exe $args
}


function Create-Provider {

    function Has-Command {

        if( (Where-Lookup-Command gulp | measure).Count ) {
            return $true;
        } else {
            return $false;
        }
    }

    function Is-Project  {
        return test-path "./gulpfile.js";
    }

    function Invoke-It {
        
        # On windows we use the "*.cmd" version
        $cmd = (where.exe gulp | select-string ".cmd$")

        #echo "args: $args"
        #echo "cmd: $cmd"

        & $cmd @args
    }

    $obj = New-Object -TypeName PSCustomObject
    $obj | Add-Member -MemberType ScriptMethod -Value (ls function:\Invoke-It).ScriptBlock -Name invoke
    $obj | Add-Member -MemberType ScriptMethod -Value (ls function:\Is-Project).ScriptBlock -Name isProject
    $obj | Add-Member -MemberType ScriptMethod -Value (ls function:\Has-Command).ScriptBlock -Name hasCommand

    return $obj
}

Create-Provider