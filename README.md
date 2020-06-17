# Udacity Cloud DevOps Capstone Project

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

### Project Description

Udacity Cloud DevOps NanoDegree Program Capstone Project done to demostrate knowledge of Building Cloud Native Application, Kubernetes, Docker, CICD, and Infrastructure as Code. Project Task Include:

- Working in AWS
- Using Jenkins to implement Continuous Integration and Continuous Deployment
- Building pipelines
- Working with Ansible and CloudFormation to deploy Kubernetes clusters (AWS EKS)
- Building Kubernetes clusters (AWS EKS)
- Building Docker containers in pipelines

### Technology Used

Flask

pytest

PyLint

Docker

Kubernetes

Jenkins

AWS - EKS, ECR, CloudFormation

Ansible

### Building from Source

You need Python 3 and a bash-like shell.

## Setup the Environment

- Create a Python virtualenv

```bash
$ python3 -m venv ~/.langitstars
```
- Activate the Python virtualenv

```bash
$ source ~/.langitstars/bin/activate
```

- Run `make install` to install the necessary dependencies

- Start the Application in Developement Environment

```bash
$ export FLASK_ENV=development; python3 -m flask run
```

### Docker And Kubernetes Script to build and run the App

1. Standalone: `python app.py`
2. Run in Docker: `./run_docker.sh`
3. Run in Kubernetes: `./run_kubernetes.sh`

### Kubernetes Steps

- Setup and Configure Docker locally
- Setup and Configure Kubernetes locally
- Create Flask app in Container
- Run via kubectl

### Verify the application is running

> Application listens on port 8000

---

### Testing

This project uses [pytest](https://docs.pytest.org/en/latest/)

### License

[MIT](https://opensource.org/licenses/MIT)

### Credits

[Intermediate Python - Nina Zakharenko](https://frontendmasters.com/courses/intermediate-python/)

### Author

[Russell Nyorere](https://neorusse.github.io/)
