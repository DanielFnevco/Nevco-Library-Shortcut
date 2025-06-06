# Define shortcut name and target URL
$shortcutName = "NevCo Library"
$url = "https://nevadacountyca.gov/3455/Library"

# Get path to user's desktop
$desktopPath = [Environment]::GetFolderPath("Desktop")
$shortcutPath = Join-Path $desktopPath "$shortcutName.url"

# Create the shortcut content 
$shortcutContent = @"
[InternetShortcut]
URL=$url
"@

# Write the shortcut to the desktop
$shortcutContent | Set-Content -Path $shortcutPath -Encoding ASCII

