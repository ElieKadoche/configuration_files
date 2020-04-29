## Commands to update the system

In common.

```shell
upgrade_oh_my_zsh
brew update
brew upgrade
brew cask upgrade --greedy
pip-review --local --interactive
python -m pip install --upgrade pip
:PlugUpdate / :PlugUpgrade # In Vim
```

Specific to MacOS and Termux.

```
softwareupdate --list # For MacOS
pkg update / pkg upgrade # For Termux
```

## Lesspass

Install lesspass pip package from source. Go into the lesspass repository and execute:

```shell
pip install ./cli
```

## Firefox

- uBlock origin.
- Firefox Color.
- HTTPS everywhere.
- LessPass.
- Markdown Here.
- Popup Blocker.

## Sabaki

Katago: set `playoutDoublingAdvantage = 3.0` and `numSearchThreads = 8`.

```shell
<path_to_leelaz>
--gtp --noponder -w <neural_net_path>
<path_to_katago>
gtp -model <neural_net_path> -config <config_path>
```

## Android

### Apps

- Termux + Termux:API.
- Dev: cxxdroid, quickedit pro, total commander, usb stick plugin.
- Baduk: tsumego pro, pandanet, tygem, kgs, ElyGo pro.
- Privacy: firefox, firefox focus, tor, lesspass.
- Comm: discord, facebook, instagram, messenger, linkedin, whatsapp, reddit, outlook.
- Google: gmail, drive, maps, contacts, docs, earth.
- Moving: citymapper, Trailforks.
- System: adobe acrobat reader, calculator++, clearscanner, lithium.
- Others: Morpion Solitaire (qilin TicTacToe), Missile Command: Recharged.

## Tor

Run tor in terminal. In network prefecerences, create new location, advanced settings, proxies, SOCKS Proxy, localhost:9050.

## Vim

After installation of Vim Plug, run `:PlugInstall` and `./install.py --all` in the repo of YouCompleteMe. `:PlugClean` to clean.
