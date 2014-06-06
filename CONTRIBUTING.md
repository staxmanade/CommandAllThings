CommandAllThings - Contribution guide
================

# How to add a new tool

1. Create a sample test project in the [samples](samples/) folder (for testing). You can look at the existing sample projects. Typically create a `test` task that prints `hello {program}` to stdout
2. PowerShell 
  - Create a windows PowerShell provider (including tests). (look at other examples in the [providers](PowerShell/providers/) folder)
  - Update the error text in [PowerShell](PowerShell/Invoke-CommandAllThings.ps1) to include the new project/file searched for
  - Update support table in the [Readme](README.md)
3. Bash
  - Update the [Bash script](bash/commandAllThings.sh) to support the new tool.
  - Update the error text in [Bash](bash/commandAllThings.sh)
  - Update support table in the [Readme](README.md)


# Run tests 

On Windows you can run the tests with [Pester](https://github.com/pester/Pester) and `Invoke-Pester` to run the tests.

On the Mac you can `npm install -g approvals` and execute the `./bash/tests.approvals.sh` file.


