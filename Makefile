# keep in sync with: https://github.com/kitconcept/buildout/edit/master/Makefile
# update by running 'make update'
SHELL := /bin/bash
CURRENT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

version = 3.7

# We like colors
# From: https://coderwall.com/p/izxssa/colored-makefile-for-golang-projects
RED=`tput setaf 1`
GREEN=`tput setaf 2`
RESET=`tput sgr0`
YELLOW=`tput setaf 3`

all: clean build test

.PHONY: Clean
clean:  ## Clean
	@echo "$(GREEN)==> Clean$(RESET)"
	git clean -Xdf

.PHONY: Build
build:  ## Build
	@echo "$(GREEN)==> Build$(RESET)"
	python$(version) -m venv . || virtualenv --clear --python=python$(version) .
	bin/pip install -r requirements.txt

.PHONY: Test
test:  ## Test
	@echo "$(GREEN)==> Test$(RESET)"
	bin/robot test.robot
