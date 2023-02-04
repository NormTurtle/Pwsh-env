# CONFIG_BY_OMI :) 

#importFirst Modules
Import-Module PSFzf
Import-Module PSReadLine
Import-Module Terminal-Icons
Invoke-Expression (&starship init powershell)  
Import-Module "~\scoop\modules\scoop-completion"

$EDITOR='nvim'
Set-Alias -Name vim -Value $EDITOR
#Set-Alias -Name vim -Value nvim
Set-Alias -Name note -Value notepads
Set-Alias -Name ll -Value  lsd
Set-Alias -Name which -Value Get-Command 
Set-Alias grep ugrep 
#Set-Alias less ~\apps\git\current\usr\bin\less.exe'

# PsReadLine
Set-PSReadLineOption -EditMode Windows
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle InlineView
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward



# change dir fastly :D
function ..   { cd ..\ }
function ...  { cd ..\.. }

function O:   { Set-Location O: }	# Drive shortcuts
function G:   { Set-Location G: }	# Drive shortcuts
function Env: { Set-Location Env: } 	# Drive shortcuts

function pgrep($name) { ps $name}    # get runnig process info
function pkill($name) { ps $name -ErrorAction SilentlyContinue | kill }  # kill any runnign process
function l { Get-ChildItem -Path $pwd -File } # list only file not folders
function df { get-volume } # get disk usage
Function IP { (Invoke-WebRequest http://ifconfig.me/ip ).Content}
function unzip {Expand-Archive } 
function reload-profile { & $profile}
function touch($file) { "" | Out-File $file -Encoding ASCII }

# Compute file hashes - useful for checking successful downloads 
function md5    { Get-FileHash -Algorithm MD5 $args }


function find-file($name) {
        ls -recurse -filter "*${name}*" -ErrorAction SilentlyContinue | foreach {
                $place_path = $_.directory
                echo "${place_path}\${_}"
        } }