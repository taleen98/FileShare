Write-Host @" 
   __ _ _           _                    
  / _(_) | ___  ___| |__   __ _ _ __ ___ 
 | |_| | |/ _ \/ __| '_ \ / _` | '__/ _ \
 |  _| | |  __/\__ \ | | | (_| | | |  __/
 |_| |_|_|\___||___/_| |_|\__,_|_|  \___|
                                         
created by: t00n
"@ -ForegroundColor Blue
Write-Host
 $Shares = Get-SmbShare
foreach ($Share in $Shares) {
    $SecurityDescriptor = $Share.SecurityDescriptor
    if ($SecurityDescriptor -like "*A;;FA;;;WD*") {
        Write-Host "$($Share.Name)" -ForegroundColor Green -NoNewline
	Write-Host ": is writable and has full access by anyone." -ForegroundColor Red
    } elseif ($SecurityDescriptor -like "*FA;;;AU*") {
        Write-Host "$($Share.Name)" -ForegroundColor Green -NoNewline
	Write-Host ": Has full access by only Authenticated Users." -ForegroundColor Cyan
    } elseif ($SecurityDescriptor -like "*GA;;;IU*")  {
        Write-Host "$($Share.Name)" -ForegroundColor Green -NoNewline
	Write-Host ": Interactive Users has read, write, execute, and delete permissions over this file share." -ForegroundColor DarkYellow
    } elseif ($SecurityDescriptor -like "*FA;;;IU*")  {
        Write-Host "$($Share.Name)" -ForegroundColor Green -NoNewline
	Write-Host ": Interactive Users has Full Access over this file share." -ForegroundColor DarkYellow
    } else {
        Write-Host "$($Share.Name)." -ForegroundColor Green -NoNewline
	Write-Host ": Regular user doesn't have access over it." -ForegroundColor Yellow
    }
}
Write-Host
