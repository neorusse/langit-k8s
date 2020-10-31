# Udacity Cloud DevOps Capstone Project

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

### Project Description

Udacity Cloud DevOps NanoDegree Program Capstone Project done to demostrate knowledge of Building Cloud Native Application, Kubernetes, Docker, CICD, and Infrastructure as Code. Project Task Include:

- Working in AWS
- Using Terraform to provision Resources - AWS VPC, EC2 Linux Machine
- Using Jenkins to implement Continuous Integration and Continuous Deployment
- Building Jenkins pipelines
- Building Docker containers in pipelines
- Creating Kubernetes clusters (AWS EKS)

### Technology Used

Python

Flask

Docker

Jenkins

AWS EC2

AWS EKS

Terraform

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

### Verify the application is running

> Application listens on port 8000

---

### Docker And Kubernetes Script to build and run the App locally

1. Standalone: `python app.py`
2. Run in Docker: `./run_docker.sh`
3. Run in Kubernetes: `./run_kubernetes.sh`

### Provision AWS EC2 AMI Linux Server using Terraform

- Download Terraform AWS Provider Plugin, run

```bash
$ terraform init
```

- To see the list of AWS resources Terraform will create, run

```bash
$ terraform plan -out ec2.tfplan
```

- To create the AWS EC2 AMI Linux Server, run

```bash
$ terraform apply "ec2.tfplan"
```

### How to Deploy the App to AWS EKS K8s Cluster:

- Create an AWS IAM User with Administrator access privillage

- Initialize Production Build by running:

```bash
$ npm run build
```

- Configure Jenkins using the AWS IAM User Credentials

- Configure Jenkins for Docker Build and Deploy to Registry

### Create the AWS EKS K8s Cluster by running:

```bash
$ eksctl create cluster -f k8s-cluster-init.yml --write-kubeconfig --set-kubeconfig-context
```

- Deploy to K8s cluster by running Jenkins

### Testing

This project uses [pytest](https://docs.pytest.org/en/latest/)

### License

[MIT](https://opensource.org/licenses/MIT)

### Credits

Python Application credit goes to [Intermediate Python - Nina Zakharenko](https://frontendmasters.com/courses/intermediate-python/)

### Author

[Russell Nyorere](https://neorusse.github.io/)
