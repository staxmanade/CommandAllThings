$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")

$provider = . "$here\$sut"

$sampleProject = "$here/../../samples/gulpSample/"
pushd $sampleProject
npm install | out-null
popd

Describe "When in a gulp project" {


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
    
    
    Mock Get-ChildItem { return " $sampleProject/gulpfile.js" }


    Context "And gulp is not installed" {
        Mock Where-Lookup-Command { return $null; }

        $hasCommand = & $provider.hasCommand;

        It "Should not exist" {
            $hasCommand | Should Be $false;
        }

    }

    
    Context "gulp IS installed" {


        Mock Where-Lookup-Command { return "C:\Users\UserA\AppData\Roaming\npm\gulp.cmd"; }

        $hasGulpCommand = & $provider.hasCommand;

        It "Should not exist" {
            $hasGulpCommand | Should Be $true;
        }

        It "Should NOT throw an exception because gulpfile should exist." {
            { & $provider.isProject } | Should Not Throw
        }

        It "Should be a project." {

            try {
                pushd $sampleProject

                & $provider.isProject | Should Be $true
            } finally{
                popd
            }
        }
    }
}


Describe "When NOT in a gulp project" {

    Mock Get-ChildItem { return $null }

    Context "gulp IS installed" {
        Mock Where-Lookup-Command { return "C:\Users\UserA\AppData\Roaming\npm\gulp
C:\Users\UserA\AppData\Roaming\npm\gulp.cmd"; }

        It "Should not exist" {
             (& $provider.hasCommand) | Should Be $true;
        }

        It "Should report not in a gulp project." {
            (& $provider.isProject) | Should Be $false
        }
    }
}
