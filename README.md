# multicloud-ci-coursera

[![Multi Cloud application with Github Actions](https://github.com/brian-lear/multicloud-ci-coursera/actions/workflows/pythonapp.yaml/badge.svg?branch=main)](https://github.com/brian-lear/multicloud-ci-coursera/actions/workflows/pythonapp.yaml)


# Setting up project
* Create new repo in GitHub
* Clone to VSCode
* Add files `main.py`, `Makefile`, `requirements.txt` and `test_main.py`
* Add commands to `Makefile` to install libs, format using `black`, use `pylint` and test using `pytest`
* Create a python virtual environment and source it if not created

```bash
python3 -m venv ~/.myrepo
source ~/.myrepo/bin/activate
```

* Test locally to see if everything is working by running `make all`

# Create a trigger for GitHub Actions
* Create a `.github/workflows`folder
* Create a `.yaml` inside it
* Add the following script to trigger on push

```name: Multi Cloud application with Github Actions

on: [push]

jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v2
    - name: Set up Python 3.8
      uses: actions/setup-python@v1
      with:
        python-version: 3.8
    - name: Install dependencies
      run: |
        make install
    - name: Format code
      run: |
        make format
    - name: Lint with pylint
      run: |
        make lint
    - name: Test with pytest
      run: |
        make test

```

# Setting up multicloud run
* Add specific requirements for each cloud (-aws, -azure, -gcp)
* Modify all command in `Makefile` to customize for each cloud

## SSH
* If SSH is not configured, run `ssh-keygen -t rsa`
* Get the public key destination and run cat "path"
* Add the SSH to GitHub

## AWS
* Log into AWS
* Enter Cloud9
* Run `git clone` and SSH path for the repo: `git@github.com:brian-lear/multicloud-ci-coursera.git`
* Enter the folder with `cd multicloud-ci-coursera`
* Run `make all-aws`
* Check if all tests passed and output of `main.py` is displayed

## Azure
* Log into Azure
* Use Cloud Shell
* Run `git clone` and SSH path for the repo: `git@github.com:brian-lear/multicloud-ci-coursera.git`
* Enter the folder with `cd multicloud-ci-coursera`
* Run `make all-azure`
* Check if all tests passed and output of `main.py` is displayed

## GCP
* Log into Azure
* Use Cloud Shell
* Run `git clone` and SSH path for the repo: `git@github.com:brian-lear/multicloud-ci-coursera.git`
* Enter the folder with `cd multicloud-ci-coursera`
* Run `make all-gcp`
* Check if all tests passed and output of `main.py` is displayed
