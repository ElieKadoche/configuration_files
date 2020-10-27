# configuration_files

General configuration files for Ubuntu, Termux and MacOS.

- `.zshrc`: zsh configuration.
- `init.vim`: neovim configuration.
- `install_apps_X.sh`: installation and configuration script for system X.
- `requirements.txt`: python pip packages.

## Firefox

- uBlock origin.
- Firefox Color.
- HTTPS everywhere.
- LessPass.
- Markdown Here.
- Popup Blocker.
- Gnome extensions.

## Baduk

### KataGo

Set `playoutDoublingAdvantage = 3.0` and `numSearchThreads = 20`.

### Sabaki

```shell
<path_to_leelaz>
--gtp --noponder -w <neural_net_path>

<path_to_katago>
gtp -model <neural_net_path> -config <config_path>
```

## Android

- Privacy: Firefox, Firefox Focus, Orbot, LessPass.
- Google: Gmail, drive, Maps, Contacts, Docs, Earth.
- Files: File Manager+, Total Commander + USB-Stick Plugin
- Dev: Termux + Termux:API + SFTP, Cxxdroid, QuickEdit+, DroiDcam.
- Baduk: Tsumego Pro, Pandanet(Go), TygemBadukLite, KGS, ElyGo pro.
- Games: Morpion Solitaire (qilin TicTacToe), Missile Command: Recharged, DroidFish.
- Communication: Discord, Facebook, Instagram, Messenger, LinkedIn, WhatsApp, Reddit.
- Others: Citymapper, Trailforks, Waze, Adobe Acrobat, Calculator++, ClearScanner, Lithium, mpv.

## Tor

Run tor in terminal. In network preferences, create new location, advanced settings, proxies, SOCKS Proxy, localhost:9050.
