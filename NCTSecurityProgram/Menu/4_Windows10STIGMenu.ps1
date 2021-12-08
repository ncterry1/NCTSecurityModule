# 4_WindowsSTIGMenu.ps1


# This is Windows 10 STIG Menu
Function Set-Header {
    Write-Host("
|==========================================================================|
|======================--- Windows 10 STIG Menu ---========================|
|==========================================================================|")
}#End Function Set-Header ==================================================


Function Set-MainMenu { 
    Write-Host ("`n Selections:`n ----------- ")
    Write-Host -ForegroundColor Yellow (" 1) Windows10 STIG Checks/Findings `t`t`tEnter: 1")

    Write-Host -ForegroundColor Yellow (" -----")
    Write-Host -ForegroundColor Yellow (" HELP   - Enter the Number + h (EX: 1h, 2h) `t`tEnter: #h")
    Write-Host -ForegroundColor Yellow (" README - Program Summary `t`t`t`tEnter: `'readme`'")
    Write-Host -ForegroundColor Red (" Quit the Program `t`t`t`t`tEnter: `'quit`'")

}#End Function Set-MainMenu==================================================



# Create global var, basically we can set the global var to quit, and in turn quit from anywhere in the program.
# Not vital, just convenient.
$Global:quit = ""


do {
    If ($Global:quit -eq "quit") {break} #If we cycle back to main menu and user has chosen to quit.
    Clear-Host
    Set-Header
    Set-MainMenu
    $choice = Read-Host ("`n`n Enter Choice: ") #This will pause and wait for user input.
    $choice = $choice -replace '\s', ""    #Remove any spaces from user input.
    $choice = $choice.ToLower()            #These choices for menu will only user numbers, and lowercase

    Switch($choice) {
    # ----------------------

        '1' {

        }#End 1
        # ----------------------

        '1h' {

        }#End 1h
        # ----------------------

        '2' {

        }#End 2
        # ----------------------

        '2h' {

        }#End 2h
        # ----------------------

        '3' {

        }#End 3
        # ----------------------

        '3h' {

        }#End 3h
        # ----------------------

        'quit' {
        # Account for all types of quitting
            $Global:quit = 'quit'
            $choice = 0
            break
        }#End quit

    # If you do not quit, this will just recycle back to the start of the menu
    }#End Switch

# Nothing asks for 0. Infinite loop until user chooses 'quit'
} until (($choice -eq 0)) #End do

