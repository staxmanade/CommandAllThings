$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\$sut"

$gruntSampleProject = "$here\..\samples\gruntSample\"
$gulpSampleProject = "$here\..\samples\gulpSample\"
$rakeSampleProject = "$here\..\samples\rakeSample\"

Describe "Invoke-CommandAllThings" {


    Context "When loading providers" {

        $providers = Get-CommandAllThingsProviders;

        It "Should load up providers" {
            $providers | Should Not Be $null;
        }

        It "Should have a gulp provider" {
            $providers.gulp | Should Not Be $null;
        }

        It "Should invoke gulp" {
            try {
                pushd $gulpSampleProject
                $result = Invoke-CommandAllThings "test"
                [string]::Join([System.Environment]::NewLine,$result) | should Match "Hello Gulp"
            } finally{
                popd
            }
        }

        

                
        It "Should invoke grunt" {
            try {
                pushd $gruntSampleProject
                $result = Invoke-CommandAllThings "test"
                [string]::Join([System.Environment]::NewLine,$result) | should Match "Hello grunt"
            } finally{
                popd
            }
        }

        It "Should invoke rake" {
            try {
                pushd $rakeSampleProject
                $result = Invoke-CommandAllThings "test"
                [string]::Join([System.Environment]::NewLine,$result) | should Match "Hello rake"
            } finally{
                popd
            }
        }

    }
}
