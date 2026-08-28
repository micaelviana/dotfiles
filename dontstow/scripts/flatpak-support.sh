#!/usr/bin/env bash
# Detectar gerenciador de pacotes disponível
if command -v apt &> /dev/null; then
    PACKAGE_MANAGER="apt"
elif command -v pacman &> /dev/null; then
    PACKAGE_MANAGER="pacman"
else
    echo "Gerenciador de pacotes não suportado. O script suporta apenas apt e pacman."
    exit 1
fi

echo "Gerenciador de pacotes detectado: $PACKAGE_MANAGER"

echo "Instalando suporte ao flatpak."
if [[ "$PACKAGE_MANAGER" == "apt" ]]; then
    sudo apt install -y flatpak
elif [[ "$PACKAGE_MANAGER" == "pacman" ]]; then
    sudo pacman -S --noconfirm flatpak
fi
