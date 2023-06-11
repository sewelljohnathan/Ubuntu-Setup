#!/bin/bash

initvenv() {

	if [[ -d .venv/ ]]; then
		read -p ".venv/ already exists. Would you like to reset it? (Y/n) " res
		if [[ "$res" != "Y" ]]; then
			return 0
		else
			rm -rf .venv/
		fi
	fi		

	python -m venv .venv
	source .venv/bin/activate
	pip install --upgrade pip

	pip install black
	pip install flake8
	pip install flake8-bandit
	pip install flake8-builtins
	pip install flake8-docstrings
	pip install isort

	pip freeze > requirements.txt	

}
