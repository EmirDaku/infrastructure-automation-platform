# infrastructure-automation-platform


## Overview

This repository demonstrates a full **infrastructure automation platform** workflow, including:

- **Virtual Machine provisioned with Terraform (IaC)** on Azure
- **Dockerized .NET 8 API** (`dotnetapp`)
- **PostgreSQL database** (`dotnetapp_database`) with persistent storage
- **Prometheus** monitoring and **Grafana** dashboards
- **CI/CD pipelines** using GitHub Actions for automated builds, tests, and deployments
- **Environment management** via `.env` file
- **Restart policies** for automatic service recovery


## Dockerfile


```dockerfile
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY  dotnetapp/ ./dotnetapp/
RUN dotnet publish ./dotnetapp -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "dotnetapp.dll"]
```
## Clone the repository

git clone https://github.com/EmirDaku/infrastructure-automation-platform/tree/main
cd infrastructure-automation-platform

## Project Structure
infrastructure-automation-platform/
│
├─ app/                          # Application layer
│   ├─ dotnetapp/                # .NET 8 application source code
│   ├─ db_backups/               # Database backup scripts or dumps
│   ├─ Dockerfile                # Dockerfile for dotnetapp
│   ├─ docker-compose.yaml       # Compose setup for app, DB, Prometheus, Grafana
│   ├─ .env                      # Environment variables for local/dev
│   └─ prometheus.yaml           # Prometheus configuration
│
├─ cd_infra/                     # Continuous Deployment & Infrastructure (Terraform)
│   ├─ .terraform/               # Terraform state files & modules
│   ├─ key-azure/                # Azure SSH keys or credentials
│   ├─ main.tf                   # Main Terraform configuration
│   ├─ provider.tf               # Terraform providers
│   ├─ variables.tf              # Terraform variables
│   ├─ prod.tfvars               # Production variables
│   ├─ terraform.tfstate         # Terraform state file (ignore in git usually)
│   └─ .terraform.lock.hcl       # Terraform provider lock file
│
├─ .github/                      # GitHub configuration
│   └─ workflows/  






