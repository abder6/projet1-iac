// Mise en place du backend dans le bucket
terraform {
  backend "s3" {
    bucket = "mon-tfstate-dyma-bucket-project-aws-abd"
    key = "projet_AWS/main/terraform.tfstate"
    region = "eu-west-3"
    use_lockfile = true
    encrypt = true
  }
}