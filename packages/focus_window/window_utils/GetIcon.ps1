param (
    [Parameter(Mandatory)][string]$ApplicationPath
)

Add-Type -AssemblyName System.Drawing
$icon = [System.Drawing.Icon]::ExtractAssociatedIcon($ApplicationPath).toBitmap()
[System.Drawing.Imaging.ImageFormat]$ImageFormat = [System.Drawing.Imaging.ImageFormat]::Png
$memory = New-Object System.IO.MemoryStream
$icon.Save($memory, $ImageFormat)

[byte[]]$bytes = $memory.ToArray()
$memory.Flush()
$memory.Dispose()

[System.Convert]::ToBase64String($bytes)