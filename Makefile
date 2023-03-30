install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

install-aws:
	pip install --upgrade pip &&\
		pip install -r requirements-aws.txt

install-azure:
	pip install --upgrade pip &&\
		pip install -r requirements-azure.txt

install-gcp:
	pip install --upgrade pip &&\
		pip install -r requirements-gcp.txt

format:
	black *.py

lint:
	pylint --disable=R,C main.py

test:
	python -m pytest -vv test_main.py

all-aws: install-aws lint test

all-azure: install-azure test

all-gcp: install-gcp lint test

all: install format lint test