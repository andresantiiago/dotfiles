#!/bin/bash

install_zsh() {
    # Função para verificar o sistema operacional
    if [ "$(uname)" == "Darwin" ]; then
        OS="MacOS"
        chsh -s $(which zsh)
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        OS="Linux"
        sudo apt install zsh curl -y
        chsh -s $(which zsh)
    else
        echo "Sistema operacional não suportado."
        exit 1
    fi
}

install_homebrew() {
    # Função pra instalar o Homebrew
    BREW_EXISTS=$(command -v brew >/dev/null 2>&1 && echo "yes" || echo "no")

    if [ "$BREW_EXISTS" = "yes" ]; then
        echo "Homebrew já está instalado."
        echo 'eval "\$(${HOMEBREW_PREFIX}/bin/brew shellenv)"' >> $HOME/.zshrc
        eval "\$(${HOMEBREW_PREFIX}/bin/brew shellenv)"
    else
        echo "Instalando Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo "Homebrew instalado com sucesso!"

        echo 'eval "\$(${HOMEBREW_PREFIX}/bin/brew shellenv)"' >> $HOME/.zshrc
        eval "\$(${HOMEBREW_PREFIX}/bin/brew shellenv)"
    fi

    # Instalando pacotes do Homebrew
    if [ "$OS" == "MacOS" ]; then
        echo "Instalando pacotes..."
        xargs brew install < "$(pwd)/install/Brewlist"
        xargs brew install < "$(pwd)/install/Brewlist_mac"
        echo "Pacotes instalados com sucesso!"
    else
        echo "Instalando pacotes..."
        xargs brew install < "$(pwd)/install/Brewlist"
        echo "Pacotes instalados com sucesso!"
    fi
}

install_ohmyzsh() {
    # https://github.com/ohmyzsh/ohmyzsh
    echo "Instalando Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}


install_powerlevel10k() {
    # https://github.com/romkatv/powerlevel10k
    echo "Instalando Powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
}

configure_zshrc() {
    # Configurações do arquivo .zshrc
    echo "Configurando .zshrc..."
    cat "$(pwd)/install/zshrc.tpl" >> $HOME/.zshrc
    echo ".zshrc configurado com sucesso!"
}

main() {
    install_zsh
    install_homebrew
    install_ohmyzsh
    install_powerlevel10k
    configure_zshrc
}

main