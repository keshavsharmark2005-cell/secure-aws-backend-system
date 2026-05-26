# AWS Backend Infrastructure Setup

## 1. Introduction

This project demonstrates a structured AWS infrastructure setup prepared for hosting a backend application using cloud engineering and DevOps concepts.

The infrastructure focuses on:
- Secure networking
- Backend deployment
- Database isolation
- Monitoring
- Infrastructure automation

Terraform configuration files are included to demonstrate Infrastructure-as-Code practices.

---

# 2. Infrastructure Workflow

```text
Client Request
      ↓
Route53 DNS
      ↓
Application Load Balancer
      ↓
EC2 Backend Instance
      ↓
PostgreSQL RDS Database
```

The architecture separates internet-facing services and internal resources using subnet isolation.

---

# 3. Network Configuration

## VPC Configuration

| Resource | Configuration |
|---|---|
| VPC Name | backend-vpc |
| CIDR Range | 172.16.0.0/16 |

The custom VPC acts as the primary network environment for all deployed AWS resources.

---

## Subnet Design

| Subnet | CIDR | Usage |
|---|---|---|
| Public Subnet | 172.16.1.0/24 | Load Balancer and EC2 |
| Private Subnet | 172.16.2.0/24 | PostgreSQL Database |

The database layer remains isolated from direct public access.

---

# 4. EC2 Backend Deployment

Amazon EC2 is used to host the backend application server.

## EC2 Configuration

| Setting | Value |
|---|---|
| Operating System | Ubuntu Server |
| Instance Type | t2.micro |
| Application Port | 3000 |

---

## Server Installation Commands

```bash
sudo apt update
sudo apt install nodejs npm -y
node -v
npm -v
```

---

## Backend Deployment

```bash
git clone <repository-url>
cd backend-project
npm install
npm start
```

The backend service receives incoming traffic through the Application Load Balancer.

---

# 5. PostgreSQL Database Setup

Amazon RDS PostgreSQL is used as the managed database service.

## Database Configuration

| Setting | Value |
|---|---|
| Engine | PostgreSQL |
| Instance Type | db.t3.micro |
| Public Access | Disabled |
| Port | 5432 |
| Backup | Enabled |

The database only accepts traffic from the backend EC2 instance.

---

# 6. Security Configuration

AWS Security Groups are used to control communication between infrastructure resources.

---

## Load Balancer Rules

| Protocol | Port | Allowed Source |
|---|---|---|
| HTTP | 80 | 0.0.0.0/0 |
| HTTPS | 443 | 0.0.0.0/0 |

---

## EC2 Rules

| Protocol | Port | Allowed Source |
|---|---|---|
| SSH | 22 | Trusted IP |
| TCP | 3000 | Load Balancer |

---

## Database Rules

| Protocol | Port | Allowed Source |
|---|---|---|
| PostgreSQL | 5432 | EC2 Security Group |

---

# 7. DNS and HTTPS

Route53 is used to map the application domain to the Load Balancer.

Example:

```text
api.backend-project.com
```

HTTPS support can be configured using AWS Certificate Manager (ACM).

---

# 8. Monitoring and Logging

Amazon CloudWatch is used for monitoring infrastructure health and performance.

## CloudWatch Monitoring

- EC2 CPU utilization
- EC2 status checks
- Database performance
- Application health monitoring
- Storage monitoring

CloudWatch alarms help detect infrastructure issues early.

---

# 9. Backup Configuration

Automated RDS backups are enabled for data protection and recovery.

| Setting | Configuration |
|---|---|
| Retention Period | 7 Days |
| Backup Type | Automated |
| Final Snapshot | Enabled |

---

# 10. Terraform Configuration

Terraform files are included inside the `terraform/` directory.

## Terraform Commands

```bash
terraform init
terraform validate
terraform plan
terraform apply
```

Terraform helps automate AWS infrastructure deployment using configuration files.

---

# 11. Security Practices Implemented

The infrastructure includes several security-focused configurations:

- Private database deployment
- Restricted SSH access
- Controlled backend traffic
- HTTPS support
- Infrastructure monitoring
- Backup management
- Least privilege access approach

---

# 12. Conclusion

This project demonstrates a cloud infrastructure deployment designed using AWS services and Infrastructure-as-Code principles.

The architecture focuses on backend deployment, secure networking, monitoring, and infrastructure organization while following beginner-level DevOps best practices.