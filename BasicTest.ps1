# Define shortcut name and target URL
$shortcutName = "NevCo Library"
$url = "https://nevadacountyca.gov/3455/Library"

# Define log file path
$logPath = "C:\Logs\LibraryShortcut.log"
if (!(Test-Path -Path (Split-Path $logPath))) {
    New-Item -ItemType Directory -Path (Split-Path $logPath) -Force | Out-Null
}

# Function to log messages
function Log-Message {
    param([string]$message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$timestamp - $message" | Out-File -FilePath $logPath -Append -Encoding UTF8
}

# Start logging
Log-Message "Script started."

try {
    # Get path to user's desktop
    $desktopPath = [Environment]::GetFolderPath("Desktop")
    $shortcutPath = Join-Path $desktopPath "$shortcutName.url"
    Log-Message "Resolved desktop path: $desktopPath"

    # Create the shortcut content 
    $shortcutContent = @"
[InternetShortcut]
URL=$url
"@

    # Write the shortcut to the desktop
    $shortcutContent | Set-Content -Path $shortcutPath -Encoding ASCII
    Log-Message "Shortcut created at: $shortcutPath"

} catch {
    Log-Message "ERROR: $_"
}

Log-Message "Script completed."
