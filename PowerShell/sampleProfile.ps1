$here = Split-Path -Parent $MyInvocation.MyCommand.Path
. "$here\Invoke-CommandAllThings.ps1"

function rake { Invoke-CommandAllThings $args }
function gulp { Invoke-CommandAllThings $args }
function grunt { Invoke-CommandAllThings $args }

function Invoke-Build { Invoke-CommandAllThings @args }
Set-Alias ib Invoke-Build
