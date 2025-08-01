output "web_server_public_ip" {
  description = "Adresse IP publique de l'instance EC2 NGINX. Accédez via http://<IP_PUBLIQUE>"
  value       = module.web_server_1.web_server_public_ip
}

output "web_server_instance_id" {
  description = "ID de l'instance EC2 NGINX."
  value       = module.web_server_1.web_server_instance_id
}

output "vpc_id_from_module" {
  description = "ID du VPC créé par le module distant."
  value       = module.vpc.vpc_id
}

output "public_subnet_ids_from_module" {
  description = "Liste des IDs des sous-réseaux publics créés par le module VPC."
  value       = module.vpc.public_subnets
}

output "private_subnet_ids_from_module" {
  description = "Liste des IDs des sous-réseaux privés créés par le module VPC."
  value       = module.vpc.private_subnets
}