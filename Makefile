# Nombre del entorno virtual
VENV_NAME = .venv

# Comando de Python (puedes cambiarlo si usas pyenv o una versión específica)
PYTHON = python3

# Activar entorno virtual (dependiendo del sistema)
ACTIVATE = source $(VENV_NAME)/bin/activate

# Nombre del archivo de requerimientos
REQUIREMENTS = requirements.txt

.PHONY: help venv install run clean freeze

help:
	@echo "Comandos disponibles:"
	@echo "  make venv       -> Crea el entorno virtual"
	@echo "  make install    -> Instala dependencias desde $(REQUIREMENTS)"
	@echo "  make run        -> Ejecuta main.py dentro del entorno virtual"
	@echo "  make freeze     -> Guarda dependencias actuales en $(REQUIREMENTS)"
	@echo "  make clean      -> Elimina el entorno virtual"

venv:
	$(PYTHON) -m venv $(VENV_NAME)
	@echo "Entorno virtual creado en $(VENV_NAME)"

install:
	$(ACTIVATE) && pip install --upgrade pip && pip install -r $(REQUIREMENTS)
	@echo "Dependencias instaladas desde $(REQUIREMENTS)"

run:
	$(ACTIVATE) && sh entrypoint.sh 

freeze:
	$(ACTIVATE) && pip freeze > $(REQUIREMENTS)
	@echo "Dependencias guardadas en $(REQUIREMENTS)"

clean:
	rm -rf $(VENV_NAME)
	@echo "Entorno virtual eliminado"
