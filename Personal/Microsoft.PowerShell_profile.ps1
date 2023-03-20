# CONFIG_BY_OMI :) 
#importFirst Modules
Import-Module PSFzf
Import-Module PSReadLine
Import-Module Terminal-Icons
Invoke-Expression (&starship init powershell)  
Import-Module "~\scoop\modules\scoop-completion"
#oh-my-posh init pwsh --config ~\scoop\apps\oh-my-posh\current\themes\pure.omp.json | iex 
# Enviroment variables
#$env:XDG_CONFIG_HOME="C:\Users\O_0\.config\"
$env:ERDTREE_CONFIG_PATH="~/.config/erdtree/.erdtreerc"
$EDITOR='nvim.exe'
Set-Alias -Name oldvim -Value vim
Set-Alias -Name vim -Value $EDITOR
#Set-Alias -Name vim -Value nvim
Set-Alias -Name nvide -Value neovide  
#Set-Alias -Name note -Value notepads
Set-Alias -Name mvp -Value mpv
Set-Alias -Name mcube -Value musikcube
Set-alias -Name brew -Value scoop 
Set-Alias -Name ll -Value  lsd
Set-Alias -Name get -Value  wget
Set-Alias -Name yt -Value  yt-dlp
Set-Alias -Name which -Value Get-Command 
Set-Alias -Name sd -Value speedtest 
Set-Alias -Name cow  -Value cowsay
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

# PsFZF 
# replace 'Ctrl+t' and 'Ctrl+r' with your preferred bindings:
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
# example command - use $Location with a different command:
$commandOverride = [ScriptBlock]{ param($Location) Write-Host $Location }
# pass your override to PSFzf:
Set-PsFzfOption -AltCCommand $commandOverride

#Function
Function mpe {~/scoop/apps/mpv/current/mpv.com $args}
Function mvi {mpv --config-dir="C:\Users\O_0\scoop\apps\mpv-git\current\portable_config\mvi" $args }
Function note {Start-Process notepads -ArgumenstList $args -NoNewWindow}
#function mpd { mpd .\.config\mpd\mpd.conf -v & } 
function gdi  { goodbyedpi & }
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
function reload-profile {
    & $profile -Force
}
function touch($file) { "" | Out-File $file -Encoding ASCII }

# Compute file hashes - useful for checking successful downloads 
function md5    { Get-FileHash -Algorithm MD5 $args }

# downlading yt-dlp with 3gp 
#Function yt3gp ($url) { yt-dlp -a "${url}"  -o "%(title)s.%(ext)s" --exec 'ffmpeg -y -i {} -filter:v "scale=704x576" -c:v h263 -c:a aac -b:a 80k -ac 1 -ar 8000 {}.3gp && del /f {}' }
Function yt3gp {
    $urls = Get-Content -Path "urls.txt"
    foreach ($url in $urls) {
        yt-dlp -a "$url" -o "%(title)s.%(ext)s" --exec 'ffmpeg -y -i {} -filter:v "scale=704x576" -c:v h263 -c:a aac -b:a 80k -ar 8000 {}.3gp && del /f {}'
    }
}

# convert video of dir using ffmpeg for dumb phone 
function ffconvert {
    $input_folder = Read-Host "Enter the input folder containing the videos to convert"
    $output_folder = Read-Host "Enter the output folder to save the converted videos"

    Get-ChildItem -Path $input_folder -Recurse -Include *.mp4,*.avi,*.mkv | ForEach-Object {
        $output_file_path = Join-Path $output_folder $_.FullName.Substring($input_folder.Length + 1)
        $output_file_path = [IO.Path]::ChangeExtension($output_file_path, ".3gp")
        New-Item -ItemType Directory -Path (Split-Path $output_file_path) -Force | Out-Null
        $cmd = "ffmpeg -y -i `"$($_.FullName)`" -vf scale=704:576 -c:v h263 -preset veryfast -crf 29 -c:a aac_mf -b:a 128k -ac 2 -ar 44100 `"$output_file_path`""
        Invoke-Expression $cmd
    }
}

function find-file($name) {
        ls -recurse -filter "*${name}*" -ErrorAction SilentlyContinue | foreach {
                $place_path = $_.directory
                echo "${place_path}\${_}"
        } }

