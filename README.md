# AWS Infrastructure Deployment Project

This repository contains a cloud infrastructure setup designed for deploying a backend application securely using AWS services and Terraform.

The project demonstrates core DevOps and cloud engineering concepts such as subnet isolation, backend hosting, managed database deployment, monitoring, and Infrastructure-as-Code practices.

---

## Infrastructure Overview

The architecture is designed using the following AWS services:

- Amazon VPC
- Public and Private Subnets
- Amazon EC2
- Amazon RDS PostgreSQL
- Application Load Balancer
- Route53
- CloudWatch
- Security Groups
- Terraform

---

## Request Flow

```text
Client → DNS Layer → Load Balancer → Application Server → Database Layer
```

---

## Main Features

- Secure VPC architecture
- Public and private subnet separation
- Backend deployment on EC2
- Managed PostgreSQL database
- CloudWatch monitoring
- Infrastructure automation using Terraform
- Controlled network access using Security Groups

---

## Project Structure

```text
aws-cloud-backend-setup/
│
├── README.md
├── AWS_SETUP.md
├── security_groups.md
├── ARCHITECTURE_DIAGRAM.png
│
└── terraform/
    ├── provider.tf
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf
    └── terraform.tfvars
```

---

## Terraform Commands

```bash
terraform init
terraform validate
terraform plan
terraform apply
```

---

## Security Configuration

- Database deployed inside private subnet
- Restricted SSH access
- RDS public access disabled
- Backend traffic filtered through Load Balancer
- Monitoring and backups enabled

---

## Note

This project contains Terraform configuration files and AWS infrastructure documentation prepared for assessment and learning purposes.

---

## Author

Keshav Sharma