## The Makefile includes instructions on environment setup and lint tests
# Create and activate a virtual environment
# Install dependencies in requirements.txt
# Dockerfile should pass hadolint
# app.py should pass pylint
# (Optional) Build a simple integration test

create:
	# Create python virtualenv
	python3 -m venv ~/.langitstars-k8s

activate:
	# Activate python virtualenv
	source ~/.langitstars-k8s/bin/activate

deactivate:
	# Activate python virtualenv
	deactivate

install:
	# This should be run from inside a virtualenv
	pip install --upgrade pip &&\
		pip install -r app/requirements.txt

start:
	# Start the app in Development Mode
	export FLASK_ENV=development; cd app && python run.py

test:
	# Additional, optional, tests could go here
	python app/test.py --verbose

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	hadolint Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	pylint --disable=R,C,W1202,W1203,W1309 app.py

all: install lint test
