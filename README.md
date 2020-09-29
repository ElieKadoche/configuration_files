# configuration_files

General configuration files for MacOS, Ubuntu and Termux.

- `init.vim`: vim configuration.
- `.zshrc`: zsh configuration.
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

## Sabaki

Katago: set `playoutDoublingAdvantage = 3.0` and `numSearchThreads = 20`.

```shell
<path_to_leelaz>
--gtp --noponder -w <neural_net_path>
<path_to_katago>
gtp -model <neural_net_path> -config <config_path>
```

## Android

### Apps

- Termux + Termux:API + SFTP.
- Dev: cxxdroid, quickedit pro, File Manager+, total commander, usb stick plugin.
- Baduk: tsumego pro, pandanet, tygem, kgs, ElyGo pro.
- Privacy: firefox, firefox focus, tor, lesspass.
- Communication: discord, facebook, instagram, messenger, linkedin, whatsapp, reddit.
- Google: gmail, drive, maps, contacts, docs, earth.
- Moving: citymapper, Trailforks, Waze.
- System: adobe acrobat reader, calculator++, clearscanner, lithium, droidcam.
- Others: Morpion Solitaire (qilin TicTacToe), Missile Command: Recharged.

## Tor

Run tor in terminal. In network preferences, create new location, advanced settings, proxies, SOCKS Proxy, localhost:9050.
