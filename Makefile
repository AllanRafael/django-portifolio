SHELL := /bin/bash
PYTHON_PATH := $(shell pwd)
export PYTHONPATH=$(PYTHON_PATH)

.PHONY: all clean install test black isort format-code sort-imports flake8 mypy black-check isort-check lint run run-dev run-db migrate migration migrate-down help run-docker

# Misc Section
help:
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

all: clean install test

install:
	poetry install

clean:
	@find . -name '*.pyc' -exec rm -rf {} \;
	@find . -name '__pycache__' -exec rm -rf {} \;
	@find . -name 'Thumbs.db' -exec rm -rf {} \;
	@find . -name '*~' -exec rm -rf {} \;
	rm -rf .cache
	rm -rf build
	rm -rf dist
	rm -rf *.egg-info
	rm -rf htmlcov
	rm -rf .tox/
	rm -rf docs/_build

# Test Section
test:
	pytest tests/ -vv

test-coverage:
	pytest --cov-branch --cov-report term-missing --cov=app tests/ -vv

#Run Section
run-db:
	docker-compose up -d migrate

run: run-db
	@docker-compose rm -f -s -v app
	@docker-compose rm -f -s -v migrate
	@python manage.py runserver 0.0.0.0:8000

run-docker:
	@docker-compose rm -f -s -v migrate
	@docker-compose up --build -d app

# Lint Section
black:
	@black .

isort:
	@isort .

format-code: black isort

sort-imports:
	@isort .

flake8:
	@flake8 .

mypy:
	@mypy .

black-check:
	@black --check .

isort-check:
	@isort --check-only .

lint: flake8 black-check isort-check

# Migration Section

migrate:
	@python manage.py migrate

migration:
	@python manage.py makemigrations
