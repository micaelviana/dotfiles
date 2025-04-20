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

# Instalar dependências com base no gerenciador de pacotes
if [[ "$PACKAGE_MANAGER" == "apt" ]]; then
    echo "Instalando dependências com apt..."
    sudo apt update
    sudo apt install -y procps build-essential curl file git
elif [[ "$PACKAGE_MANAGER" == "pacman" ]]; then
    echo "Instalando dependências com pacman..."
    sudo pacman -Syu --noconfirm base-devel curl file git procps-ng
fi

# Instalar Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
