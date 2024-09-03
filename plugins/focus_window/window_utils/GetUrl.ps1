param (
    [string]$app,
    [string]$windowTitle
)

Add-Type -AssemblyName System.Windows.Forms

$selcetKey = "{F4}"
$deseclectKey = "{F6}"

if ($app -eq "msedge") {
    $selcetKey = "{F4}"
    $deseclectKey = "{F6}"
}
elseif ($app -eq "chrome") {
    $selcetKey = "%d"
    $deseclectKey = "+{F6}"   
}
elseif ($app -eq "firefox") {
    $selcetKey = "{F6}"
    $deseclectKey = "+{F6}" 
}
elseif ($app -eq "brave") {
    $selcetKey = "%{d}" #alt + d
    $deseclectKey = "+{F6}"  
}
else {
    # not supported platform
    return
}

$lastVal = Get-Clipboard -Raw
$wshell = New-Object -ComObject wscript.shell
$Null = $wshell.AppActivate("AppActivate")
Set-Clipboard -Value $null
$address = $null
$count = 1
# Write-Host "Pressing $selcetKey"
[System.Windows.Forms.SendKeys]::SendWait($selcetKey)
do {
    if ($count % 2 -eq 0) {
        [System.Windows.Forms.SendKeys]::SendWait($selcetKey)
        # Write-Host "Pressing $selcetKey"
    }
    # Write-Host "Pressing ^c"
    [System.Windows.Forms.SendKeys]::SendWait("^c")
    $address = Get-Clipboard
    $count = $count + 1
    Start-Sleep -Milliseconds 1
}
while ($null -eq $address -And $count -lt 10)
Set-Clipboard -Value $lastVal
# Write-Host "Pressing $deseclectKey"
[System.Windows.Forms.SendKeys]::SendWait($deseclectKey)
Remove-Variable wshell
Remove-Variable lastVal
$BrowserUrl = $address

Write-Host $BrowserUrl 