CommandAllThings - Contribution guide
================

# How to add a new tool

1. Create a sample test project in the [samples](samples/) folder (for testing). You can look at the existing sample projects. Typically create a `test` task that prints `hello {program}` to stdout.
2. PowerShell 
  - Create a windows PowerShell provider (including tests). (look at other examples in the [providers](PowerShell/providers/) folder)
  - Update the error text in [PowerShell](PowerShell/Invoke-CommandAllThings.ps1) to include the new project/file searched for
  - Update support table in the [Readme](README.md)
3. Bash
  - Update the [Bash script](bash/commandAllThings.sh) to support the new tool.
  - Update the error text in [Bash](bash/commandAllThings.sh)
  - Update support table in the [Readme](README.md)


# Run tests 

## Windows

We leverage a PowerShell BDD testing framework called [Pester](https://github.com/pester/Pester). Once installed and module loaded you can `Invoke-Pester` to run the tests.

## Mac/Linux

On the Mac I have a strange testing strategy of running a bunch of task commands in the terminal, capturing standard out and using [approvals](https://github.com/approvals/approvals.nodejs) to diff the output with the expected output.

To run the tests you first must install the approvals command line utility using npm (which comes with [nodejs](http://nodejs.org/).

`npm install -g approvals`

Then you can run this script

`./bash/tests.approvals.sh`


