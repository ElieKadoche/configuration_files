# configuration_files

General configuration files for Ubuntu and Termux (Android).

- `init.vim`: neovim configuration.
- `requirements.txt`: python pip packages.
- `.zshrc`: zsh configuration (specific to my usage).
- `install_apps_X.sh`: installation and configuration script for system X.

## Firefox extensions

- Dark Reader.
- Firefox Color.
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
- To redirect a port (for example, Tensorboard): `ssh -L 16006:127.0.0.1:6006 <user>@<ip> -p <port>`, and go to [127.0.0.1:6006](127.0.0.1:6006).
- To share files with `sshfs`: `sshfs <user>@<ip>: -p <port> <folder_path_in_which_to_mount>`.
- To share files with `scp`: `scp -P <port> <user>@<ip>:<file_path_to_share> <path_location>`.

To share files or a website with the world (with or without password) --> Apache2.

## Android

Google Play builds are no longer updated for Termux (https://github.com/termux/termux-app/issues/1072).
So Termux needs to be installed from F-Droid (https://f-droid.org/FDroid.apk), along with Termux:API.

- Baduk: ElyGo pro, Go Clock, KGS, Pandanet(Go), Tsumego Pro, TygemBadukLite.
- Communication: Discord, Facebook, Instagram, LinkedIn, Messenger, Signal, Slack, Teams, Reddit, Twitch, Twitter, WhatsApp.
- Development: Detexify, DroidCam, Cxxdroid, QuickEdit+, Termux, Termux:API.
- Files: File Manager+, Total Commander + SFTP.
- Games: Chess, DroidFish, Morpion Solitaire (qilin TicTacToe), Sudoku (the clean one).
- Google: Chrome, Clock, Contacts, Docs, Earth, Drive, Gmail, News, Maps, Translate.
- Maps: Citymapper, Trailforks, Waze.
- Others: Disney+, Netflix, Uber Eats, Wikipedia.
- Privacy: Authy, BNP, Firefox, Firefox Focus, LessPass, Orbot, Tor Browser.
- Utils: Adobe Acrobat, Adobe Scan, Calculator++, Collabora Office, Lithium, mpv, PowerPoint, SVG viewer, TeamViewer.
