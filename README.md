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
