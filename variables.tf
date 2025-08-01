//Variable afin de reutiliser le projet 
//Pour chosir la region
variable "aws_region" {
  description = "La région AWS où les ressources seront déployées."
  type        = string
  default     = "eu-west-3"
}

variable "instance_type" {
  description = "Le type d'instance EC2 à utiliser pour le serveur web."
  type        = string
  default     = "t2.micro"

  validation {
    condition     = contains(["t2.micro", "t2.small", "t3.micro", "t3.small"], var.instance_type)
    error_message = "Le type d'instance doit être t2.micro, t2.small, t3.micro, ou t3.small."
  }
}

variable "project_name" {
  description = "Nom du projet, utilisé pour le taggage des ressources."
  type        = string
  default     = "projet_AWS"
}



variable "vpc_cidr_block" {
  description = "Le bloc CIDR pour le VPC principal."
  type        = string
  default     = "10.0.0.0/16"
}