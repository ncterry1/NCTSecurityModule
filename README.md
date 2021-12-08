README - NCTSecurity Module
This is built around a PowerShell Module implementation, with external uses of C#, Python, etc. The NCTSecurityProgram focuses on Windows 10/11 Security. This is an all-encompassing security module for as many aspects of Windows 10/11 checks, findings, and fixes.

The NCTSecurityModule was built to accomplish everything, and run through the NCTSecurityProgram. That functions as a menu that can be used to call every security measure; however, nearly every associated function created for this Module can also be run independantly. These functions all have assciated help information that can be viewed with:

> Get-Help <function-name> -full
All functions associated with NCTSecurityModule were built to be run primarily from the '\NCTSecurityModule\NCTSecurityProgram'

> .\RunNCTSecurityProgram.ps1
Within the 'NCTSecurityModule' directory, the NCTSecurityProgram has an associated 'Shortcut' This can be run/pinned to anywhere on the machine; however, regardless of where it is run from, the default location that the NCTSecurityProgram will always used for data, reports, functions etc. is the WindowsPowershell location that the progrma copies itself to during execution:

'C:\Program Files\WindowsPowerShell\Modules\NCTSecurityModule'
This module setup can be done automatically as an Administrator in PowerShell 1) Move to where the NCTSecurityModule directory has been downloaded to. 2) Install the Module:

> .\InstallNCTSecurityModule.ps1
You can also right-click on the InstallNCTSecurityModule.ps1 script, and select "Run With PowerShell" This requires that current user has Admin privileges.

This will copy over all of the NCTSecurityModule from the downloaded directory to the: 'C:\Program Files\WindowsPowerShell\Modules\NCTSecurityModule' If the system does not then delete the downloaded NCTSecurityModule directory, that should be done automatically. Once installed, the NCTSecurityModule should only be run from the: 'C:\Program Files\WindowsPowerShell\Modules\NCTSecurityModule' directory As all actions, and results will now be called from, and saved to this directory.

Once installed, the program can be executed in 2 different ways. 1) Double-Click on: 'C:\Program Files\WindowsPowerShell\Modules\NCTSecurityModule\NCTSecurityProgram\RunNCTSecurityProgram - Shortcut' This shortcut can also be pinned anywhere on the machine.

2) Or from PowerShell, as an Administrator, execute the RunNCTSecurityProgram script: > .\RunNCTSecurityProgram.ps1

This will automatically, re-import menu's and functions associated with NCTSecurityModule in case any code changes were made. Then it will run the NCTSecurityProgram as intended.

As stated, the menu's and functions were built to be run from the NCTSecurityProgram, but these can be called individually as well. The individual calls stil would require a NCTSecurityModule import first to add the functions to the PowerShell cache.

There are 2 ways to install/import the NCTSecurityModule. 1) The first is as listed above, and execute the:

> .\InstallNCTSecurityModule.ps1
2) However, there is a standard PowerShell module installation as well. Copy the 'NCTSecurityModule' directory to:

'C:\Program Files\WindowsPowerShell\Modules\'
This can be done through manually, or through PowerShell by:

> Copy-Item .\NCTSecurityModule\ -Destination "C:\Program Files\WindowsPowerShell\Modules\" -Force -Recurse
Then, from PowerShell, execute the target module import:

> Import-Module -Name "NCTSecurityModule"
Now all 'NCTSecurityModule' menus and functions are active through PowerShell, but it is still recommended to use

> .\RunNCTSecurityProgram.ps1
To Remove the NCTSecurityModule
Note - There may be an error in PowerShell if you have this directory open in Windows Exporer while you try to execute a 'Remove-Item'

> Remove-Item -Path "C:\Program Files\WindowsPowerShell\Modules\NCTSecurityModule\" -Force -Recurse
Once you have removed the directory, then remove the module from the memory cache:

> Remove-Module -Name "NCTSecurityModule"
