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








