## Commands to update the system

```shell
brew update
brew upgrade
brew cask upgrade --greedy
pip-review --local --interactive
python3 -m pip3 install --upgrade pip3
:PlugUpdate / :PlugUpgrade # In Vim
softwareupdate --list # For macOS
pkg update / pkg upgrade # For termux
```

## Firefox

- uBlock origin.
- Firefox Color.
- HTTPS everywhere.
- LessPass.
- Markdown Here.
- Popup Blocker.

## Sabaki

Compile with `g++-9` with: `DCMAKE_CXX_COMPILER=<path_to_g++-9>`. Set `playoutDoublingAdvantage = 3.0` and `numSearchThreads = 8`.
/usr/local/Cellar/leela-zero/version/bin/leelaz
--gtp --noponder -w <neural_net_path>
/Users/eliekadoche/desktop/KataGo/cpp/katago
gtp -model <neural_net_path> -config <config_path>

## Android

### Apps

- Termux + Termux:API.
- Dev: cxxdroid, quickedit pro, total commander, usb stick plugin.
- Baduk: tsumego pro, pandanet, tygem, kgs, ElyGo pro.
- Privacy: firefox, firefox focus, tor.
- Comm: discord, facebook, instagram, messenger, linkedin, whatsapp, reddit, outlook.
- Google: gmail, drive, maps, contacts, docs.
- Moving: citymapper, Trailforks.
- System: adobe acrobat reader, calculator++, clearscanner, lithium.
- Others: Hex, Morpion Solitaire (qilin TicTacToe).

## Tor

Run tor in terminal. In network prefecerences, create new location, advanced settings, proxies, SOCKS Proxy, localhost:9050.

## Vim

After installation of Vim Plug, run `:PlugInstall` and `./install.py --all` in the repo of YouCompleteMe. `:PlugClean` to clean.
