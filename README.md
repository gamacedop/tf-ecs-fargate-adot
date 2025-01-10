# PPP Project

This repository provides a modular and reusable structure for managing infrastructure as code and application deployments, supporting multiple environments (dev, stg, prod) and prepared for CI/CD integration with tools like Jenkins.

## Features
- **Infrastructure Management**: Modular Terraform configuration for AWS resources.
- **Application Deployment**: Dockerized application support for scalable ECS Fargate services.
- **Multi-Environment Support**: Configurations for `dev`, `stg`, and `prod`.
- **Future CI/CD Ready**: Prepared structure for Jenkins pipelines.

## Getting Started

### Prerequisites
- Terraform v1.5+
- AWS CLI configured with appropriate permissions
- Docker (if building the application image locally)

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
  - **modules/**: Reusable modules for data_layer, main, and compute.
  - **envs/**: Environment-specific configurations (`dev`, `stg`, `prod`).
    - `backend.hcl`: Backend configuration for Terraform state.
  - **scripts/**: Deployment scripts.

### CI/CD
- **ci/**: Configuration and scripts for Continuous Integration and Continuous Deployment.
  - `jenkins/`: Includes the `Jenkinsfile` for pipeline definitions.

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

## License
[MIT License](LICENSE)
