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
        [bool] $gridview
    )#End Param----------------------
    
        #Function Tasks
        $timestamp = Get-Date -f 'yyyy-MM-dd-HHmms'
    
        # Get-location of this script.
        $gl = $PSScriptRoot
        $modulePath = $gl.TrimEnd("\NCTFunctions") #Moves back to main NCTSecurityModule directory.
        $resultsPath = "$modulePath\NCTData" #Directs path to the data directory. 
        If(!(Test-Path -Path $resultsPath))

        # Get local machine IPv4
        $ipv4 = (Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias Ethernet).IPAddress
            
        Write-Host("Checking for Vulnerability: V-220932")
        # Target Registry Key
        $key = "HKLM:\System\CurrentControlSet\Services\LanManServer\Parameters"
        # Target Registry Key Attribute
        $name = "RestrictNullSessAccess"
        # STIG Compliant Value
        $expectedValue = 1
        # Gather local values from the Registry Key
        $reg = Get-ItemProperty -Path $key -Name $value
        # Narrow these values down to just the target attribute.
        $currentValue = $reg.$name

        If($currentValue -eq 1) {
            Write-Host ("Key: $key")
            Write-Host ("Name: $name")
            Write-Host ("Expected Value: $expectedValue")
            Write-Host ("Current Value: $currentValue")
            Write-Host -ForegroundColor Green ("STIG Compliant")
            
        } Else {
            Write-Host -ForegroundColor Red ("Not STIG Compliant")
            Write-Host -ForegroundColor Red ("Value is set to $currentValue, not the expected value of $expectedValue")
        }
    
    
    
        # If function ends up with a single result
        $results = ""
    
        # Return that result
        return $results
    
    }#End Function Search-V-220932