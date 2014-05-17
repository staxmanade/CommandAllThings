$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
$provider = . "$here\$sut"

$sampleProject = "$here/../../samples/gruntSample/"
pushd $sampleProject
npm install | out-null
popd

Describe "When in a grunt project" {

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
    

    
    Mock Get-ChildItem {return " $sampleProject/gruntfile.js" }


    Context "And grunt is not installed" {
        Mock Where-Lookup-Command { return $null; }

        $hasCommand = & $provider.hasCommand;

        It "Should not exist" {
            $hasCommand | Should Be $false;
        }

    }

    
    Context "grunt IS installed" {
        Mock Where-Lookup-Command { return "C:\Users\UserA\AppData\Roaming\npm\grunt.cmd"; }

        $hasCommand = & $provider.hasCommand;

        It "Should not exist" {
            $hasCommand | Should Be $true;
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


Describe "When NOT in a grunt project" {


    Mock Get-ChildItem {return $null }

    Context "grunt IS installed" {
        Mock Where-Lookup-Command { return "C:\Users\UserA\AppData\Roaming\npm\grunt
C:\Users\UserA\AppData\Roaming\npm\grun.cmd"; }

        It "Should not exist" {
             & $provider.hasCommand | Should Be $true;
        }

        It "Should report not in a gulp project." {
            & $provider.isProject | Should Be $false
        }
    }
}
