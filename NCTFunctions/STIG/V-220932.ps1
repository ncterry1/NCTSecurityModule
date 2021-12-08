# Windows 10 STIG
# V-220932

Function Search-V-220932 {
    <#
        .AUTHOR
            Nate Terry
    
        .SYNOPSIS
            Anonymous access to Named Pipes and Share must be restricted.
    
        .DESCRIPTION
            Allowing anonymous access to named pipes or shares provides to potential for unauthorized system access. This setting restricts access to those defined in "Network access: Shares that can be accessed anonymously", both of which must be blank under other requirements.
    
        .OUTPUTS
            If the following registry value does not exist or is not configured as specified, this is a finding:
            Expected:
            Registry Hive:  HKEY_LOCAL_MACHINE
            Registry Path:  \System\CurrentControlSet\Services\LanManServer\Parameters\
            Value Name:     RestrictNullSessAccess
            Value Type:     REG_DWORD
            Value:          1
    #>
    #================================
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $false)] #User must include 'gridview' when calling function.
        [string] "STIG"
    )#End Param----------------------


        # Set the HashTable for the target STIG
        $V_220932 = @{
            key = 'HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters'
            name = 'RestrictNullSessAccess'
            expectedValue = 1
            currentValue = $null
        }#End V-220932 HashTable


        # Capture target registry values, add specific value to hashtable.
        $reg = Get-ItemProperty -Path $V_220932.key -Name $V_220932.name
        $V_220932["currentValue"] = $reg.($V_220932.name)


        If($V_220932.currentValue -eq 1) {
            Write-Host ("Key: " + $V_220932.key)
            Write-Host ("Name: " + $V_220932.name)
            Write-Host ("Expected Value: " + $V_220932.expectedValue)
            Write-Host ("Current Value: " + $V_220932.currentValue)
            Write-Host -ForegroundColor Green ("STIG Compliant")
        } Else {
            Write-Host -ForegroundColor Red ("Not STIG Compliant")
            Write-Host -ForegroundColor Red ("Value is set to " + $V_220932.currentValue +", not the expected value of " + $V_220932.expectedValue)
        }#End If/Else
    
    
            
        #Function Tasks
        $timestamp = Get-Date -f 'yyyy-MM-dd-HHmms'
    

        # Get-location of this script.
        $gl = $PSScriptRoot
        $modulePath = $gl.TrimEnd("\NCTFunctions") #Moves back to main NCTSecurityModule directory.
        $resultsPath = "$modulePath\NCTData" #Directs path to the data directory. 
        If(!(Test-Path -Path $resultsPath))


        # Get local machine IPv4
        $ipv4 = (Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias Ethernet).IPAddress
            
    
        # If function ends up with a single result
        $results = ""
    
        # Return that result
        return $results
    
    }#End Function Search-V-220932