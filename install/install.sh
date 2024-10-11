#!/bin/bash

install_homebrew() {
    # Função pra instalar o Homebrew
    BREW_EXISTS=$(command -v brew >/dev/null 2>&1 && echo "yes" || echo "no")

    if [ "$BREW_EXISTS" = "yes" ]; then
        echo "Homebrew já está instalado."
        echo "Instalando pacotes..."
        xargs brew install < "$(pwd)/Brewlist"
        echo "Pacotes instalados com sucesso!"
    else
        echo "Instalando Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo "Homebrew instalado com sucesso!"

        echo "Instalando pacotes..."
        xargs brew install < "$(pwd)/Brewlist"
        echo "Pacotes instalados com sucesso!"
    fi
}

set_zsh() {
    # Função para configurar o Zsh como shell padrão
    ZSH_EXISTS=$(command -v zsh >/dev/null 2>&1 && echo "yes" || echo "no")

    if [ "$BREW_EXISTS" = "yes" ]; then
        chsh -s $(which zsh)
        echo "Zsh configurado como shell padrão."
    else
        echo "Instalando Zsh..."
        brew install zsh
        chsh -s $(which zsh)
        echo "Zsh configurado como shell padrão."
}

install_ohmyzsh() {
    # https://github.com/ohmyzsh/ohmyzsh
}

install_fzf() {
    # https://github.com/junegunn/fzf
}

install_powerlevel10k() {
    # https://github.com/romkatv/powerlevel10k
}

main() {
    install_homebrew
    # set_zsh
    # install_ohmyzsh
    # install_fzf
    # install_powerlevel10k
}

main