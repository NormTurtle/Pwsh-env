Write-host "its sad to see it made u had some with ittrouble  ~(>_<。)＼"  -Foregroundcolor Blue

if ((Test-Path -Path $PROFILE)) { rm $profile  }
~\scoop\apps\7zip\current\uninstall-context.reg
if ((Test-Path -path ~/scoop )) { scoop uninstall scoop }
if ((Test-Path -path ~/scoop )) { del ~\scoop -Recurse -Force  }
UnInstall-Module -Name PSFzf 
UnInstall-Module PSReadLine
UnInstall-Module -Name Terminal-Icons 
write-host "				
	 ＼（〇_ｏ）／ NOW - DELETE SCOOP/ FROM UR USER's HOME"
