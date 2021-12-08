# Function Template
# Remember that if you create a new function here, or edit an existing function, you need to import the NCTSecurityModule again, to import that new/updated function into the PowerShell cache.

Function Get-FunctionName {
<#
    .AUTHOR

    .SYNOPSIS

    .DESCRIPTION

    .Example
    # Results printed to terminal
    > Get-FunctionName -gridview $false
    
    .Example
    # Results printed to the gridview
    > Get-FunctionName -gridview $true

    .OUTPUTS
    # Sample Output from Function
#>
#================================
[CmdletBinding()]
Param(
    [Parameter(Mandatory = $true)] #User must include 'gridview' when calling function.
    [bool] $gridview
)#End Param----------------------

    #Function Tasks
    $timestamp = Get-Date -f 'yyyy-MM-dd-HHmms'

    # Get-location of this script.
    $gl = $PSScriptRoot
    $modulePath = $gl.TrimEnd("\NCTFunctions") #Moves back to main NCTSecurityModule directory.
    $resultsPath = "$modulePath\NCTData" #Directs path to the data directory. 




    # If function ends up with a single result
    $results = ""

    # Return that result
    return $results

}#End Function Get-FunctionName