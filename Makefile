OS := $(shell uname)
SCRIPT := ./install/install.sh

install: run-script

# Executa o script se o sistema for macOS
run-script:
	@$(SCRIPT)

.PHONY: install run-script