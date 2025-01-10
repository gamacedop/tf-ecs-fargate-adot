# Terraform ECS Fargate with ADOT Collector

This repository provides a Terraform configuration to deploy an Amazon ECS service on Fargate, including the OpenTelemetry (ADOT) Collector as a sidecar.

## Features
- ECS service with Fargate launch type
- OpenTelemetry Collector for observability
- Staging environment configuration
- Modular and reusable Terraform structure

## Getting Started

### Prerequisites
- Terraform v1.3+
- AWS CLI configured with appropriate permissions

### Quick Start
1. Clone the repository:
   ```bash
   git clone https://your-repo-url.git
   cd tf-ecs-fargate-adot
   ```
2. Initialize Terraform:
   ```bash
   terraform init
   ```
3. Apply the configuration:
   ```bash
   terraform apply
   ```

## Project Structure
- **modules/**: Contains reusable Terraform modules.
- **environments/**: Environment-specific configurations (e.g., staging).
- **scripts/**: Deployment scripts.

## License
[MIT License](LICENSE)
