SHELL := /bin/bash
CHDIR_SHELL := $(SHELL)

##### v1.0.0 (Jan 28 2014)

##### SETTINGS
VENV = env/bin/activate
PIP = . $(VENV); env/bin/pip
BRANCH = master


# CORE COMMANDS
run:
	. $(VENV); sphinx-autobuild docs docs/_build/html

init:
	##### setup virtualenv
	test -d $(VENV) || virtualenv env --prompt="(`basename \`pwd\``)"
	$(PIP) install -r requirements.txt
	##### done

update:
	##### update from git
	git pull origin $(BRANCH)
	$(PIP) install -r requirements.txt --upgrade
	##### done