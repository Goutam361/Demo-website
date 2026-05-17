$desktopPath = "C:\Users\user\OneDrive\Desktop"
$websiteFolder = "$desktopPath\3D website"

Write-Host "Copying assets into the repository..."

if (Test-Path "$desktopPath\brand") {
    Copy-Item -Path "$desktopPath\brand" -Destination "$websiteFolder\brand" -Recurse -Force
    Write-Host "Copied 'brand' folder"
}

if (Test-Path "$desktopPath\Video") {
    Copy-Item -Path "$desktopPath\Video" -Destination "$websiteFolder\Video" -Recurse -Force
    Write-Host "Copied 'Video' folder"
}

if (Test-Path "$desktopPath\design") {
    Copy-Item -Path "$desktopPath\design" -Destination "$websiteFolder\design" -Recurse -Force
    Write-Host "Copied 'design' folder"
}

$absVideo = "C:\Users\user\Downloads\hf_20260509_121724_565834f8-cd68-467a-bffd-afb535612b13.mp4"
if (Test-Path $absVideo) {
    Copy-Item -Path $absVideo -Destination "$websiteFolder\Video\hf_20260509_121724_565834f8-cd68-467a-bffd-afb535612b13.mp4" -Force
    Write-Host "Copied background video"
}

Write-Host "`nAll assets copied! Now pushing to GitHub automatically..."

Set-Location $websiteFolder

# Ensure it's treated as a safe directory to avoid ownership errors
git config --global --add safe.directory "$websiteFolder"

# Add, commit, and push
git add .
git commit -m "Fixed missing assets for website"
git push origin main

Write-Host "`n================================================="
Write-Host "Success! The website has been updated on GitHub."
Write-Host "Your live site will update in a few minutes."
Write-Host "================================================="
Write-Host "`nPress any key to exit..."
$Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | Out-Null
