CommandAllThings - Contribution guide
================

# How to add a new tool

1. Create a sample test project in the [samples](samples/) folder (for testing)
2. PowerShell 
  - Create a windows PowerShell provider (including tests). (look at other examples in the [providers](PowerShell/providers/) folder)
  - Update the error text in [PowerShell](PowerShell/Invoke-CommandAllThings.ps1) to include the new file searched for
  - Update [Readme](PowerShell/README.md)
3. Bash
  - Update the [Bash script](bash/commandAllThings.sh) to support the new tool.
  - Update the error text in [Bash](bash/commandAllThings.sh)
  - Update [Readme](bash/README.md)

# Run tests with PowerShell

But you can use [Pester](https://github.com/pester/Pester) and `Invoke-Pester` to run the tests...
