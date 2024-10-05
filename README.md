# Financial Crime and Corruption Network Motifs

<center><img src="images/Graphlet-AI-Banner-with-Hypergraph-and-Womans-Head.jpg" /></center>

A repository of network motifs indicating risk in financial and transaction networks for financial crime and corruption.

## The Blog Posts

This project was created in the course of three blog posts:

1. [Financial Crime and Corruption Network Motifs](https://blog.graphlet.ai/financial-crime-and-corruption-network-motifs-4cf2e8e10eb5/)
2. [Sigma Rules + FollowTheMoney → Crime and Corruption Risk Motifs](https://blog.graphlet.ai/sigma-rules-followthemoney-crime-and-corruption-risk-motifs-9227825962c6)
3. [Graphlet AI: Financial Crime and Corruption Network Motifs]()

## Data Model

The motifs in this project are based on the [FollowTheMoney](https://followthemoney.tech) data model for financial networks. It represents a simple but comprehensive model for financial networks and transactions.

## Pre-Requisites

To run the code in this repository, you will need the following:

- [Docker](https://docs.docker.com/get-docker/)

To develop locally, you will need the following:

- [Anaconda Python](https://www.anaconda.com/products/individual)
- [Poetry](https://python-poetry.org/docs/#installation)

Supported operating systems:

- Mac OS X
- Ubuntu Linux
- Windows support is in progress

## Docker Quickstart

You can use the [`docker-compose.yml`](docker-compose.yml) file to test the code in this repository. To start the Docker container, run the following command:

```bash
docker-compose up
```

## Code Environment Setup

We use a Docker image to run this project. You can also setup the environment locally so the code will work in VSCode or another editor. We provide a development tools setup using `black`, `flake8`, `isort`, `mypy` and `pre-commit` for you to modify and use as you see fit.

### Install Anaconda Python

We use Anaconda Python, Python version 3.12.6, for this course. You can download Anaconda Python from [here](https://www.anaconda.com/products/individual). Once it is installed, you can create a new environment for this project by running the following command:

```bash
conda create -n motifs python=3.12 -y
```

When you create a new environment or start a new shell, you will need to activate the `motifs` conda environment with the following command:

```bash
conda activate motifs
```

Now you are running Python 3.12 in the `motifs` environment. To use this Python in VSCode, hit SHIFT-CMD-P (on Mac) and select `Python: Select Interpreter`. Then select the `motifs` environment's Python.

To deactivate this environment, run:

```bash
conda deactivate
```

### Install Poetry for Dependency Management

We use [Poetry](https://python-poetry.org/) for dependency management, as it makes things fairly painless. 

#### Install Poetry Using `curl`

To install using `curl`, just run:

```bash
curl -sSL https://install.python-poetry.org | python3 -
```

#### Install Poetry using `pipx`

To first install `pipx`, on Mac OS X run:

```bash
brew install pipx
pipx ensurepath
sudo pipx ensurepath --global # optional to allow pipx actions with --global argument
```

On Ubuntu Linux, run:

```bash
sudo apt update
sudo apt install pipx
pipx ensurepath
sudo pipx ensurepath --global # optional to allow pipx actions with --global argument
```

Then install Poetry using `pipx`:

```bash
pipx install poetry
```

It will now be outside your virtual environment and available to all your Python projects.

### Install Dependencies via Poetry

```bash
poetry install
```

## Running the Code

The code relies on a series of pytests in [`tests/test_motifs.py`](tests/test_motifs.py). To run the tests, use the following command:

```bash
pytest
```
