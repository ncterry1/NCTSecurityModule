<#
.AUTHOR
    NATE TERRY

.SYNOPSIS
    This module is used as a Windows Security repository. Checks, findings, and fixes to maintain Windows devices.
    Focused on Windows 10/11

.DESCRIPTION
    When thi smodule is imported, the functiosn are loaded using the dot-sourcing below.
    Primary module imports are done here to apply to all related sub-functions.
    This .psm1 (Module) canot be executed directly as a script, it will only be called when importing this module.
    These Steps will be done by the ImportNCTSecurityModule.ps1
    Step 1)
        Find the local PowerShell Module pathways:
        > $env:PSModulePath -split ";"

    Step 2)
        Move this \NCTSecurityModule (Full Directory) to one of those module pathways:
        > Copy-Item .\NCTSecurityModule -Destination "C:\Program Files\WindowsPowerShell\Modules" -Force -Recurse

    Step 3) 
        Once NCTSecurityModule is copied into a PowerShell Module path, we can import the module into the PowerShell cache.
        > Import-Module "NCTSecurityModule" -Force -Verbose

    We created a ".\InstallNCTSecurityModule.ps1" that does all of this automatically if run including calling this module script.
    Now we can call the .\RunNCTSecurityProgram from the \NCTSecurityProgam directory, since the module has been imported.
#>

# ========================================================================================
# These imports are needed to operate certain parts this particular module.
# This assume the Remote Server Administration has-been/can-be installed.
# These may be needed for specific functions, but may not be able to be installed on a machine due to system restrictions.
# -------------------------------
#Get-WindowsCapability -Name RSAT* -Online | Select-Object -Property DisplayName, State
#Install-WindowsFeature -Name GPMC
#Import-Module GroupPolicy
#Import-Module ActiveDirectory
# -------------------------------

# PSScriptRoot is the in-the-moment path to where this file is being executed from.
$functionPath = $PSScriptRoot + "\NCTFunctions\"

# Gather a list of all of the function names created in the NCTSecurityModule sub-folder.
$functionList = Get-ChildItem -Path $functionPath -Name

# Loop over all of the files and dot-source them into the PowerShell system memory. 
# The dot is key. Do not delete the dot
ForEach ($function in $functionList) {
    . ($functionPath + $function)
}
