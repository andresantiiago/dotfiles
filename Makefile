OS := $(shell uname)
BREW_EXISTS := $(shell command -v brew >/dev/null 2>&1 && echo "yes" || echo "no")

install: detect-os install-homebrew

detect-os:
	@if [ "$(OS)" != "Darwin" ]; then \
		echo "Este script só suporta macOS."; \
		exit 1; \
	else \
		echo "Sistema detectado: macOS"; \
	fi

install-homebrew:
	@if [ "$(BREW_EXISTS)" = "yes" ]; then \
		echo "Homebrew já está instalado."; \
		echo "Instalando pacotes..."; \
		/bin/bash -c "xargs brew install < $(CURDIR)/install/Brewlist"; \
		echo "Pacotes instalados com sucesso!"; \
	else \
		echo "Instalando Homebrew..."; \
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
		@echo "Homebrew instalado com sucesso!"; \

		echo "Instalando pacotes..."; \
		/bin/bash -c "xargs brew install < $(CURDIR)/install/Brewlist"; \
		echo "Pacotes instalados com sucesso!"; \
	fi

.PHONY: install detect-os install-homebrew