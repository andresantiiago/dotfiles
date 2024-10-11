OS := $(shell uname)
SCRIPT := ./install/install.sh

install: detect-os run-script

# Verificando o sistema operacional
detect-os:
	@if [ "$(OS)" = "Darwin" ]; then \
		echo "Sistema operacional detectado: macOS"; \
	else \
		echo "Este instalador é específico para MacOS (Por enquanto...)."; \
		exit 1; \
	fi

# Executa o script se o sistema for macOS
run-script:
	@$(SCRIPT)

.PHONY: install detect-os run-script