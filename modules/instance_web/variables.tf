variable "instance_type" {
  description = "Le type d'instance EC2 à utiliser pour le serveur web."
  type        = string
  default     = "t2.micro"

}
variable "ami_id" {
  description = "ID de l'AMI a utiliser pour EC2"
  type        = string

}
variable "project_name" {
  description = "Nom du projet, utilisé pour le taggage des ressources."
  type        = string
  
}
variable "environment_tag" {
  description = "Tag d'environnement (ex: Development, Staging, Production)."
  type        = string
}

//Partie VPC

variable "subnet_id" {
  description = "L'ID du sous-réseau dans lequel lancer l'instance EC2."
  type        = string
}
variable "vpc_id" {
  description = "L'ID du VPC pour le groupe de sécurité de l'instance."
  type        = string
}

variable "secret_tag_value_sm" {
description = "Valeur secrete de SM pour un tag de démonstration"
type = string
sensitive = true
}