# Projeto Portfólio Pessoal

## Descrição do Projeto
Este projeto tem como objetivo a criação de um portfólio pessoal, com o intuito de apresentar os projetos desenvolvidos durante o curso de Análise e Desenvolvimento de Sistemas, bem como os projetos desenvolvidos durante a carreira profissional.

## Tecnologias Utilizadas
- HTML
- CSS
- JavaScript
- Bootstrap
- JQuery
- Django
- Python

## Requisitos para Execução
- Python 3.9+
- [Docker](https://docs.docker.com/engine/install/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [Make](https://www.gnu.org/software/make/)

## Execução local
Para executar o projeto, basta executar o comando `make run` na raiz do projeto. O projeto estará disponível em `http://localhost:8000/`.


## Execução em Docker
Para executar o projeto em Docker, basta executar o comando `make docker-run` na raiz do projeto. O projeto estará disponível em `http://localhost:8000/`.

## Estrutura do Projeto
```shell
.
├── docker-compose.yaml
├── Dockerfile
├── Makefile
├── manage.py
├── poetry.lock
├── portifolio
│   ├── asgi.py
│   ├── __init__.py
│   ├── __pycache__
│   │   ├── __init__.cpython-39.pyc
│   │   ├── settings.cpython-39.pyc
│   │   ├── urls.cpython-39.pyc
│   │   └── wsgi.cpython-39.pyc
│   ├── settings.py
│   ├── urls.py
│   └── wsgi.py
├── pyproject.toml
├── README.md
├── static
└── templates
    ├── base.html
    └── home.html

4 directories, 18 files
```