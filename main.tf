terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.6.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region  = var.aws_region
}

data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"] # Propriétaire de l'AMI

  filter {
    name = "name"
    # Modèle de nom pour Amazon Linux 2023 AMI (standard x86_64)
    values = ["al2023-ami-*-kernel-*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}
data "aws_secretsmanager_secret" "api_key_secret_medatada" { // methode arn
  arn = "arn:aws:secretsmanager:eu-west-3:148867357643:secret:projet1/app/api_key-zF4uRt"
}


data "aws_secretsmanager_secret_version" "app_api_key_secret" { // methode classique
  secret_id = data.aws_secretsmanager_secret.api_key_secret_medatada.id
}

//module vpc
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.0.1"

  name = "${var.project_name}-VPC-${terraform.workspace}"
  cidr = var.vpc_cidr_block # Utilise la variable définie dans variables.tf racine

  azs             = ["${var.aws_region}a", "${var.aws_region}b", "${var.aws_region}c"] # Exemple pour 3 AZs
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]                      # Exemple de CIDRs pour sous-réseaux privés, 3 au cas ou 1 tombe 
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]                # Exemple de CIDRs pour sous-réseaux publics

  enable_nat_gateway = terraform.workspace == "prod" ? true : false # Crée une NAT Gateway pour les sous-réseaux privés (peut engendrer des coûts)
  single_nat_gateway = true                                         # Utilise une seule NAT Gateway pour toutes les AZs (réduit les coûts)

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = local.common_tags
}

// Lancement du module
module "web_server_1" {
  source              = "./modules/instance_web"
  ami_id              = data.aws_ami.amazon_linux_2023.id
  environment_tag     = terraform.workspace
  instance_type       = local.current_instance_config.instance_type
  project_name        = var.project_name
  subnet_id           = module.vpc.public_subnets[0]
  vpc_id              = module.vpc.vpc_id
  secret_tag_value_sm = jsondecode(data.aws_secretsmanager_secret_version.app_api_key_secret.secret_string)["my_app_api_key"]
}

