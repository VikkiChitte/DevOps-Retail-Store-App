# DevOps-Retail-Store-App

A microservices-based retail store application deployed on AWS.

## Project Structure

```
DevOps-Retail-Store-App/
│
├── .github/
│   └── workflows/
│       ├── ci-catalog.yml          # CI pipeline for catalog service
│       ├── ci-cart.yml             # CI pipeline for cart service
│       ├── ci-orders.yml           # CI pipeline for orders service
│       ├── ci-checkout.yml         # CI pipeline for checkout service
│       ├── ci-ui.yml               # CI pipeline for ui service
│       ├── _reusable-ci.yml        # Shared reusable CI logic
│       └── cd-deploy.yml           # CD pipeline - deploys to EKS
│
├── src/                            # Microservices source code
│   ├── catalog/                    # Go service
│   ├── cart/                       # Java/Spring Boot service
│   ├── orders/                     # Java/Spring Boot service
│   ├── checkout/                   # Java/Spring Boot service
│   └── ui/                         # Node.js service
│
├── terraform/                      # Infrastructure as Code
│   ├── ecr/                        # ECR repositories
│   ├── eks/                        # EKS cluster
│   ├── vpc/                        # VPC and networking
│   ├── rds/                        # RDS databases
│   └── environments/
│       ├── dev/                    # Dev environment config
│       └── prod/                   # Prod environment config
│
├── k8s/                            # Kubernetes manifests
│   ├── base/                       # Base manifests per service
│   │   ├── catalog/
│   │   ├── cart/
│   │   ├── orders/
│   │   ├── checkout/
│   │   └── ui/
│   └── overlays/                   # Environment overrides (Kustomize)
│       ├── dev/
│       └── prod/
│
├── docker-compose.yml              # Local development
└── README.md
```

## CI/CD Flow

```
Code Push
    ↓
CI Pipeline (GitHub Actions)
  → Build & Test
  → Push image to ECR
    ↓
CD Pipeline
  → Update k8s image tag
  → Deploy to EKS
    ↓
Terraform (separate pipeline)
  → Provision/update AWS infra
```

## Services

| Service  | Language    | Port |
|----------|-------------|------|
| catalog  | Go          | 8080 |
| cart     | Java        | 8080 |
| orders   | Java        | 8080 |
| checkout | Java        | 8080 |
| ui       | Node.js     | 8080 |

## Prerequisites

- AWS CLI
- Terraform >= 1.0
- kubectl
- Docker
