$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$provider = & "$here\Invoke-Build.Provider.ps1"

$sampleProject = "$here/../../../samples/Invoke-BuildSample/"

Describe "When in Invoke-Build project" {

    Context "when loading the provider" {

        It "Should have loaded" {
            $provider | should not be $null
        }

        It "Should have invoke script block" {
            $provider.invoke | should not be $null
        }

        It "Should have hasCommand script block" {
            $provider.hasCommand | should not be $null
        }

        It "Should have isProject script block" {
            $provider.isProject | should not be $null
        }

    }

    Context "and Invoke-Build is not installed" {
        # copy provider
        $provider = @{} + $provider
        # fake resolveCommand
        $provider.resolveCommand = {}

        $hasCommand = & $provider.hasCommand
        It "Should not exist" {
            $hasCommand | Should Be $false;
        }
    }

    Context "and Invoke-Build is installed" {

        $hasCommand = & $provider.hasCommand
        It "Should exist" {
            $hasCommand | Should Be $true
        }

        It "Should not throw because .build.ps1 should exist." {
            { & $provider.isProject } | Should Not Throw
        }

        It "Should be a project." {
            try {
                Push-Location $sampleProject
                & $provider.isProject | Should Be $true
            }
            finally {
                Pop-Location
            }
        }
    }
}

Describe "When not in Invoke-Build project" {
    Push-Location $here
    try {
        It "Should report not in Invoke-Build project." {
            & $provider.isProject | Should Be $false
        }
    }
    finally {
        Pop-Location
    }
}
