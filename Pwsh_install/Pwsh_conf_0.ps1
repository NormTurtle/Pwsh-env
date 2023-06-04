# CONFIG_BY_OMI :) 

#importFirst Modules
Import-Module PSFzf
Import-Module PSReadLine
Invoke-Expression (&starship init powershell)  
Import-Module "~\scoop\modules\scoop-completion"

#Set-Alias -Name vim -Value nvim
Set-Alias -Name ll -Value  lsd
Set-Alias -Name which -Value Get-Command 
Set-Alias grep ugrep 

# PsReadLine   GOOD TAB Completion
Set-PSReadLineOption -EditMode Windows
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle InlineView
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# Functions   aka command alias for powershell
Function hosts {gsudo nvim %windir%\system32\drivers\etc\hosts} # winow host files Netwrok related
function pgrep($name) { ps $name}    # get runnig process info
function pkill($name) { ps $name -ErrorAction SilentlyContinue | kill }  # kill any runnign process

# Lazy Loading ICons
Function Load-TerminalIcons {
    if (-not (Get-Module -Name Terminal-Icons)) {
        Import-Module Terminal-Icons
    }
}
Function IconsDelayedLs {
    Load-TerminalIcons
    Get-ChildItem $args
}
Set-Alias -Name ls -Value IconsDelayedLs
