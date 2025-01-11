# Variables globales
TF_DIR = infra
ENV ?= dev

# Comandos de Terraform
init:
	@echo "Initializing Terraform in $(TF_DIR)/envs/$(ENV)";
	cd $(TF_DIR)/envs/$(ENV) && terraform init --backend-config=backend.hcl

plan:
	@echo "Planning Terraform deployment for $(ENV) environment";
	cd $(TF_DIR)/envs/$(ENV) && terraform plan -var-file=../../shared/variables.tfvars

apply:
	@echo "Applying Terraform changes to $(ENV) environment";
	cd $(TF_DIR)/envs/$(ENV) && terraform apply -var-file=../../shared/variables.tfvars -auto-approve

# Limpieza
clean:
	@echo "Cleaning Terraform state in $(ENV) environment";
	cd $(TF_DIR)/envs/$(ENV) && rm -rf .terraform .terraform.lock.hcl

# Creación del backend
setup-backend:
	@echo "Setting up the backend for Terraform";
	bash $(TF_DIR)/backend-setup/setup-backend.sh

# Backend Configuration
backend-config:
	@echo "Terraform backend configuration example:";
	@echo "terraform {";
	@echo "  backend \"s3\" {";
	@echo "    bucket       = \"example-bucket\"";
	@echo "    key          = \"path/to/state\"";
	@echo "    region       = \"us-east-1\"";
	@echo "    use_lockfile = true";
	@echo "  }";
	@echo "}"

# Ayuda
help:
	@echo "Comandos disponibles:"
	@echo "  make init          - Inicializa Terraform en el entorno especificado"
	@echo "  make plan          - Genera un plan de ejecución para Terraform"
	@echo "  make apply         - Aplica los cambios de Terraform"
	@echo "  make clean         - Limpia archivos temporales de Terraform"
	@echo "  make setup-backend - Configura el backend de Terraform"
	@echo "  make backend-config - Muestra ejemplo de configuración del backend"
	@echo "  ENV=<env>          - Establece el entorno (dev, stg, prod)"
