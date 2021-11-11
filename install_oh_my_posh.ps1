echo "Installing Caskaydia Cove Nerd Fonts.."
./Scripts/install_fonts.ps1
echo "Caskaydia Cove Nerd Fonts installed."

echo "Installing Oh My Posh.."
winget install JanDeDobbeleer.OhMyPosh
echo "Oh My Posh Installed."

echo "Reloading PATH.."
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 

echo "Updating Profile.."
$ConfigDir = "$env:USERPROFILE\Documents\ohmyposh\config"
$ConfigFileName = "ohmyposhv3-2_GR.json"

mkdir $ConfigDir -Force
Copy-Item ".\config\ohmyposhv3-2_GR.json" -Destination "$ConfigDir\$ConfigFileName" -Force
(echo "oh-my-posh --init --shell pwsh --config $ConfigDir\$ConfigFileName | Invoke-Expression") >$PROFILE

Write-Host "Oh My Posh has beee Installed!" -ForegroundColor DarkGreen
Write-Host "However, in order for this to work properly, you need to manually set the correct font in powershell:" -ForegroundColor DarkGreen
Write-Host "In this terminal window, go to 'Settings > Windows PowerShell > Appearance', select 'CaskaydiaCove NF' and press 'Save'." -ForegroundColor DarkYellow
Write-Host "Once this has been done, restart Terminal and you're good to go! :D" -ForegroundColor DarkYellow
