 # CONFIG_BY_OMI :)
#importFirst Modules
Import-Module PSFzf
Import-Module PSReadLine
Import-Module gsudoModule
Import-Module Terminal-Icons
Invoke-Expression (&starship init powershell)
Import-Module "~\scoop\modules\scoop-completion"
Invoke-Expression (&sfsu hook) # replace the scoop
# portal completion powershell | Out-String | Invoke-Expression
# oh-my-posh init pwsh --config ~\scoop\apps\oh-my-posh\current\themes\pure.omp.json | iex

# Set Env:variables in shell
#$ [Environment]::SetEnvironmentVariable("VARIABLE", "Value", "User")
# E.g [Environment]::SetEnvironmentVariable("NEOVIDE_MULTIGRID", "1", "User")

# Enviroment variables also for VI
# $env:OPENAI_API_KEY='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'
# komorebi
$Env:KOMOREBI_CONFIG_HOME = "$Env:USERPROFILE\.config\komorebi"
# NVIM
$env:XDG_CONFIG_HOME="$Env:USERPROFILE\.config"
$env:XDG_STATE_HOME="$Env:USERPROFILE\.cache"
$env:XDG_STATE_DIR="$Env:USERPROFILE\.cache"
$env:XDG_DATA_HOME="$Env:USERPROFILE\.cache"
$env:MANGAL_CONFIG_PATH= "C:\Users\O_0\.config\mangal\"
# $env:NEOVIDE_FRAME="none" # remove bar and title buttons
# $env:NEOVIDE_MULTIGRID=1 # use animation of windows & scroll
$env:EDITOR = 'neovide.exe'
$env:PAGER = 'bat'
$EDITOR='neovide.exe'
Set-Alias -Name vim -Value $EDITOR
Set-Alias -Name ivm -Value $EDITOR
Set-Alias -Name nvide -Value neovide
Set-Alias -Name vide -Value neovide
Set-Alias -Name mvp -Value mpv
Set-Alias -Name et -Value erd.exe
Set-Alias -Name mcube -Value musikcube
Set-Alias -Name lolcat -Value rainbow
Set-alias -Name brew -Value scoop
Set-Alias -Name ll -Value  lsd
Set-Alias -Name yt -Value  yt-dlp
Set-Alias -Name which -Value Get-Command
Set-Alias -Name sd -Value speedtest
Set-Alias -Name tpgt -Value tgpt
Set-Alias -Name cow  -Value cowsay
Set-Alias -Name sudo -Value gsudo
Set-Alias -Name stream -Value streamlink
# PsFZF
# replace 'Ctrl+t' and 'Ctrl+r' with your preferred bi  ndings:
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
# example command - use $Location with a different command:
$commandOverride = [ScriptBlock]{ param($Location) Write-Host $Location }
# pass your override to PSFzf:
Set-PsFzfOption -AltCCommand $commandOverride

# how to make [[ symblinks? ]]
# New-Item -ItemType SymbolicLink -Path  "C:\Users\path_new_dest"  -Target  "C:\Users\O_0\target_path"
#Function
Function note {Start-Process notepads $args -NoNewWindow}
Function get  {xh -d $args}
Function mpe {~/scoop/apps/mpv/current/mpv.com $args}
Function mvi {mpv --config-dir="C:\Users\O_0\scoop\apps\mpv-git\current\portable_config\mvi" $args }
function gdi  { goodbyedpi & }
Function hosts {gsudo nvim %windir%\system32\drivers\etc\hosts}

#Function convert($cmd) {magick convert $cmd }
# change dir fastly :D
Function ..   { cd ..\ }
function ...  { cd ..\.. }
function l { Get-ChildItem -Path $pwd -File } # list only file not folders

function O:   { Set-Location O: }	# Drive shortcuts
function G:   { Set-Location G: }	# Drive shortcuts
function Env: { Set-Location Env: } 	# Drive shortcuts

function pgrep($name) { ps $name}    # get runnig process info
function pkill($name) { ps $name -ErrorAction SilentlyContinue | kill }  # kill any runnign process
function df { get-volume } # get disk usage
Function ip { (Invoke-WebRequest http://ifconfig.me/ip ).Content} # get *ONLY* IP
Function ipinfo { (curl http://ipinfo.io)} # get full info of IP
function unzip {Expand-Archive }   # unzip fliles from  without needing to install anythign
function reload-profile { & $profile -Force }

# PsReadLine
Set-PSReadLineOption -EditMode Windows
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle InlineView
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key Ctrl+C -Function Copy
Set-PSReadLineKeyHandler -Key Ctrl+v -Function Paste


# downlading yt-dlp with 3gp
##Function yt3gp ($url) { yt-dlp -a "${url}"  -o "%(title)s.%(ext)s" --exec 'ffmpeg -y -i {} -filter:v "scale=704x576" -c:v h263 -c:a aac -b:a 80k -ac 1 -ar 8000 {}.3gp && del /f {}' }
