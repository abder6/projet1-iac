## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 6.6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.6.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_web_server_1"></a> [web\_server\_1](#module\_web\_server\_1) | ./modules/instance_web | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_ami.amazon_linux_2023](https://registry.terraform.io/providers/hashicorp/aws/6.6.0/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | La région AWS où les ressources seront déployées. | `string` | `"eu-west-3"` | no |
| <a name="input_environment_tag"></a> [environment\_tag](#input\_environment\_tag) | Tag d'environnement (ex: Development, Staging, Production). | `string` | `"Development"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Le type d'instance EC2 à utiliser pour le serveur web. | `string` | `"t2.micro"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Nom du projet, utilisé pour le taggage des ressources. | `string` | `"projet_AWS"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_web_server_instance_id"></a> [web\_server\_instance\_id](#output\_web\_server\_instance\_id) | ID de l'instance EC2 NGINX. |
| <a name="output_web_server_public_ip"></a> [web\_server\_public\_ip](#output\_web\_server\_public\_ip) | Adresse IP publique de l'instance EC2 NGINX. Accédez via http://<IP\_PUBLIQUE> |
