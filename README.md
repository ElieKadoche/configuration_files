# configuration_files

General configuration files for Ubuntu and Termux (Android).

- `init.vim`: neovim configuration.
- `requirements.txt`: python pip packages.
- `.zshrc`: zsh configuration (specific to my usage).
- `install_apps_X.sh`: installation and configuration script for system X.

## Firefox extensions

- Dark Reader.
- GNOME Shell integration.
- HTTPS Everywhere.
- LessPass.
- Markdown Here.
- Popup Blocker (strict).
- uBlock Origin.

## KataGo

Set `playoutDoublingAdvantage = 3.0` and `numSearchThreads = 20`.

## Sabaki

Engines configuration (local).

```shell
<path_to_leelazero_executable>
--gtp --noponder -w <neural_net_path>

<path_to_katago_executable>
gtp -model <neural_net_path> -config <config_path>
```

Engines configuration (remote).

```shell
ssh
-t <user>@<ip> -p <port> <path_to_leelazero_executable> --gtp --noponder -w <neural_net_path>

ssh
-t <user>@<ip> -p <port> <path_to_katago_executable> gtp -model <neural_net_path> -config <config_path>
```

## SSH

Private variables and commands are declared in a `.zsh` file placed in `$ZSH_CUSTOM` folder.

- For basic usage: `ssh <user>@<ip> -p <port>`.
- For X11 forwarding: `ssh -X <user>@<ip> -p <port>`.
- To redirect a port (for example, Tensorboard): `ssh -L 16006:127.0.0.1:6006 <user>@<ip> -p <port>`.
- To share files with `sshfs`: `sshfs <user>@<ip>: -p <port> <folder_path_in_which_to_mount>`.
- To share files with `scp`: `scp -P <port> <user>@<ip>:<file_path_to_share> <path_location>`.

## Android

- Privacy: Firefox, Firefox Focus, Orbot, LessPass.
- Google: Gmail, drive, Maps, Contacts, Docs, Earth.
- Files: File Manager+, Total Commander + USB-Stick Plugin
- Dev: Termux + Termux:API + SFTP, Cxxdroid, QuickEdit+, DroidCam.
- Baduk: Tsumego Pro, Pandanet(Go), TygemBadukLite, KGS, ElyGo pro.
- Communication: Discord, Facebook, Instagram, Messenger, LinkedIn, WhatsApp, Reddit.
- Games: Morpion Solitaire (qilin TicTacToe), Missile Command: Recharged, DroidFish, Sudoku (the clean one).
- Others: Citymapper, Trailforks, Waze, Adobe Acrobat, Calculator++, SVG Viewer, SVG Viewer, SVG Viewer, ClearScanner, Lithium, mpv, Wikipedia.
