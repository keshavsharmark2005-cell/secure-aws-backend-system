# AWS Security Group Configuration

This document describes the security group configuration used in the AWS backend infrastructure setup.

Security Groups are used to regulate inbound and outbound network traffic between AWS resources such as Load Balancers, EC2 instances, and RDS databases.

The infrastructure uses separate security layers to maintain controlled communication and improve resource protection.

---

# 1. Load Balancer Security Rules

The Application Load Balancer handles incoming public traffic from users.

## Inbound Rules

| Protocol | Port | Source | Purpose |
|---|---|---|---|
| HTTP | 80 | 0.0.0.0/0 | Allow web traffic |
| HTTPS | 443 | 0.0.0.0/0 | Allow encrypted traffic |

### Description

The Load Balancer accepts both HTTP and HTTPS traffic from the internet and forwards requests to the backend EC2 application server.

---

# 2. EC2 Instance Security Rules

The EC2 instance hosts the backend application service.

## Inbound Rules

| Protocol | Port | Source | Purpose |
|---|---|---|---|
| SSH | 22 | Trusted IP Only | Secure administration access |
| TCP | 3000 | Load Balancer Security Group | Backend application traffic |

### Description

Direct public access to the backend server is restricted. Application requests are only accepted through the Load Balancer.

SSH access is limited to trusted IP addresses for security purposes.

---

# 3. RDS PostgreSQL Security Rules

The PostgreSQL database is deployed inside the private subnet.

## Inbound Rules

| Protocol | Port | Source | Purpose |
|---|---|---|---|
| PostgreSQL | 5432 | EC2 Security Group | Database communication |

### Description

The database layer only accepts connections from the backend EC2 server.

Public internet access is disabled to reduce exposure and improve database security.

---

# 4. Security Measures Implemented

The infrastructure includes the following security practices:

- Private subnet isolation for database resources
- Restricted SSH access
- Controlled backend traffic routing
- Security Group based access filtering
- HTTPS support planned
- Database public access disabled
- Least privilege access approach

These configurations help improve infrastructure reliability and reduce unauthorized access risks.

---

# 5. Infrastructure Communication Flow

```text
Internet Traffic
        ↓
Application Load Balancer
        ↓
EC2 Backend Application
        ↓
PostgreSQL Database
```

Each infrastructure layer is protected using dedicated security group rules to maintain secure communication between services.