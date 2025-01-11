# PPP Project

This repository provides a modular and reusable structure for managing infrastructure as code, application deployments, and monitoring, supporting multiple environments (dev, stg, prod) and prepared for CI/CD integration with tools like Jenkins.

## Features

- **Infrastructure Management**: Modular Terraform configuration for AWS resources.
- **Application Deployment**: Dockerized application support for scalable ECS Fargate services.
- **Multi-Environment Support**: Configurations for `dev`, `stg`, and `prod`.
- **Future CI/CD Ready**: Prepared structure for Jenkins pipelines.
- **Centralized Monitoring**: Amazon Managed Grafana integration for monitoring AWS infrastructure.

## Getting Started

### Prerequisites

- Terraform v1.10+
- AWS CLI configured with appropriate permissions
- Docker (if building the application image locally)
- Access to Amazon Managed Grafana workspace

### Quick Start

#### Clone the Repository
```bash
git clone https://your-repo-url.git
cd ppp
```

#### Initialize Terraform
1. Navigate to the desired environment folder (e.g., `infra/envs/dev`):
   ```bash
   cd infra/envs/dev
   ```
2. Initialize Terraform with the backend configuration:
   ```bash
   terraform init
   ```

#### Apply the Configuration
1. Review the Terraform plan:
   ```bash
   terraform plan
   ```
2. Apply the configuration:
   ```bash
   terraform apply
   ```

## Project Structure

### Application
- **app/**: Contains the application source code and Dockerfile.
  - `src/`: Source code of the application.
  - `Dockerfile`: Containerization configuration for the application.
  - `requirements.txt`: Dependencies for the application.

### Infrastructure
- **infra/**: Infrastructure managed via Terraform.
  - **modules/**: Reusable modules for data_layer, compute, and network.
  - **envs/**: Environment-specific configurations (`dev`, `stg`, `prod`).
    - `backend.hcl`: Backend configuration for Terraform state.
  - **shared/**: Shared infrastructure configurations, such as variables and outputs.

### CI/CD
- **ci/**: Configuration and scripts for Continuous Integration and Continuous Deployment.
  - `jenkins/`: Includes the `Jenkinsfile` for pipeline definitions.

### Monitoring
- **Amazon Managed Grafana**: Integrated to monitor the AWS infrastructure. 
  - **Key AWS Services Monitored**:
    - **Amazon CloudWatch**: Performance metrics.
    - **AWS X-Ray**: Distributed tracing.
    - **Amazon Lambda**: Serverless application monitoring.
    - **Amazon EC2**: Compute resource monitoring.
  - **Benefits**:
    - Centralized dashboards for metrics and logs.
    - Real-time visualization and analysis.

## Deployment Process

### Application Deployment
1. Build the Docker image:
   ```bash
   docker build -t your-app-image .
   ```
2. Push the Docker image to your container registry (e.g., AWS ECR).

### CI/CD Integration
- Add your Jenkins pipeline script in `ci/jenkins/Jenkinsfile`.
- Configure Jenkins to trigger deployments based on environment changes.

## Monitoring with Amazon Managed Grafana

### Prerequisites
1. Access to an AWS account with appropriate permissions.
2. Amazon Managed Grafana workspace set up in your desired AWS region.

### Steps
1. Navigate to the **Amazon Managed Grafana** console.
2. Configure data sources:
   - **CloudWatch** for logs and metrics.
   - **X-Ray** for tracing.
3. Grant access to users using AWS IAM roles or AWS Identity Center.
4. Set up dashboards for visualizing metrics and traces.

## License
[MIT License](LICENSE)
