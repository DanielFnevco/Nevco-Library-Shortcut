# Define the URL and the path for the shortcut
$webUrl = "https://nevadacountyca.gov/3455/Library"
$shortcutPath = "$env:USERPROFILE\Desktop\Nevada County Library.url"

# Create the content of the .url file
$shortcutContent = @"
[InternetShortcut]
URL=$webUrl
"@

# Save the content to the .url file
$shortcutContent | Set-Content -Encoding ASCII -Path $shortcutPath

