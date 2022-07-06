Write-Output "Installing chocolatey."
# ------------------------------------------

# https://chocolatey.org/install
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco feature enable -n=allowGlobalConfirmation

Write-Output "Installing pacakges."
# ------------------------------------------

choco install 7zip
choco install adobereader
choco install audacity
choco install blender
choco install cinebench
choco install cmake --installargs 'ADD_CMAKE_TO_PATH=User'
choco install discord
choco install epicgameslauncher
choco install firacode
choco install firefox
choco install geekbench5
choco install geforce-experience
choco install gimp
choco install git
choco install goggalaxy
choco install googlechrome
choco install googleearthpro
choco install hwinfo
choco install hwmonitor
choco install inkscape
choco install intellijidea-community
choco install libreoffice-fresh
choco install miktex
choco install mingw
choco install mpv
choco install neovim
choco install nodejs
choco install nvidia-geforce-now
choco install okular
choco install openssl
choco install pandoc
choco install pycharm-community
choco install python
choco install python --version=3.8.0 --side-by-side
choco install rawtherapee
choco install scrcpy
choco install sshfs
choco install steam
choco install strawberryperl
choco install teamviewer
choco install tor-browser
choco install transmission
choco install youtube-dl

Write-Output "Updating pacakges."
# ------------------------------------------

choco upgrade chocolatey
choco upgrade all -y

# Others
# ------------------------------------------

# Disable fast startup
powercfg -h off

<#
https://github.com/textext/textext/releases
https://lmms.io/
https://rog.asus.com/fr/motherboards/rog-strix/rog-strix-x570-e-gaming-model/helpdesk_download/
https://rog.asus.com/us/innovation/armoury_crate/
https://visualstudio.microsoft.com/vs/community/
https://www.blizzard.com/fr-fr/apps/battle.net/desktop
https://www.ea.com/fr-fr/ea-app-beta
https://www.foxwq.com/soft/foreign.html
https://www.intel.fr/content/www/fr/fr/support/detect.html
https://www.logitechg.com/en-us/innovation/g-hub.html
https://www.nvidia.com/Download/index.aspx
https://www.razer.com/fr-fr/synapse-3
#>
