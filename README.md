## Commands to update the system

```shell
brew update
brew upgrade
brew cask upgrade --greedy
pip-review --local --interactive
python3 -m pip3 install --upgrade pip3
:PlugUpdate / :PlugUpgrade # In Vim
softwareupdate --list
```

## Firefox

- uBlock origin.
- Firefox Color.
- HTTPS everywhere.
- LessPass.
- Markdown Here.
- Popup Blocker.

## Git

    git config core.filemode false
    git config credential.helper store

## Hombrew

    brew leaves # See installed packages

## Sabaki

Compile with `g++-9` with: `DCMAKE_CXX_COMPILER=<path_to_g++-9>`. Set `playoutDoublingAdvantage = 3.0` and `numSearchThreads = 8`.
/usr/local/Cellar/leela-zero/version/bin/leelaz
--gtp --noponder -w <neural_net_path>
/Users/eliekadoche/desktop/KataGo/cpp/katago
gtp -model <neural_net_path> -config <config_path>

## Android

### Apps

- Dev: cxxdroid, quichedit pro, total commander, usb stick plugin.
- Baduk: tsumego pro, pandanet, tygem, kgs, Ah Q Go.
- Privacy: firefox, firefox focus, tor.
- Comm: discord, facebook, instagram, messenger, linkeding, whatsapp, reddit.
- Google: gmail, drive, maps, contacts, doc.
- Moving: citimapper, Trailforks.
- System: adobe acrobat reader, calculator++, clearscanner, lithium.
- Others: leafpic, Hex, Morpion Solitaire (qilin TicTacToe).

### Termux

Install Termux (git, texlive, tlmgr install scheme-full, python, tor, mpv, zip, unzip, unrar) + Termux:API. Uncomment associated lines in `.zshrc`. Write in `~/.termux/termux.properties`:

```
extra-keys = [ \
    ['ESC','|','/','HOME','UP','END','PGUP','DEL'], \
    ['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN','BKSP'] \
]
```

termux-reload-settings
Others:
termux-setup-storage
install oh-my-zsh # See doc

## Tor

Run tor in terminal. In network prefecerences, create new location, advanced settings, proxies, SOCKS Proxy, localhost:9050.

## Vim

After installation of Vim Plug, run `:PlugInstall` and `./install.py --all` in the repo of YouCompleteMe. `:PlugClean` to clean.
