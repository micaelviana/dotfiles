# Dotfiles

## Usage

Clone into your `$HOME` directory

HTTPS:
```bash
git clone https://github.com/micaelviana/dotfiles.git
```
SSH:
```bash
git clone git@github.com:micaelviana/dotfiles.git
```

## Ubuntu
Backup packages

```sh
apt list --installed | awk -F'/' '{print $1}'
```


## Arch

Backup packages

```sh
pacman -Qet | awk '{print $1 }'
```

 ### AUR Helper
```bash
    sudo pacman -S --needed git base-devel && \
    git clone https://aur.archlinux.org/yay-bin.git && \
    cd yay-bin && \
    makepkg -si
```

