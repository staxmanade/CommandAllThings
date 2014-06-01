
<#
.Synopsis
    Invoke-Build provider for CommandAllThings PowerShell.

.Notes
    Requires the variable $Provider = <this script data>.
#>

@{
    name = 'Invoke-Build'

    invoke = {
        if ($cmd = & $Provider.resolveCommand) {
            & $cmd @args
        }
    }

    isProject = {
        Test-Path *.build.ps1
    }

    hasCommand = {
        [bool](& $Provider.resolveCommand)
    }

    resolveCommand = {
        [CmdletBinding()]param()
        if (Test-Path Invoke-Build.ps1) {
            return $PSCmdlet.GetUnresolvedProviderPathFromPSPath('Invoke-Build.ps1')
        }
        foreach($_ in Get-Command Invoke-Build.ps1* -Type ExternalScript) {
            if ($_.Name -eq 'Invoke-Build.ps1') {
                return $_.Path
            }
        }
    }
}
