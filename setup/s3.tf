//Création du bucket s3 
resource "aws_s3_bucket" "tfstate" {
  bucket = "mon-tfstate-dyma-bucket-project-aws-abd"

  tags = {
    Name        = "Terraform State Bucket - projet1"
    Environment = "Backend"
    ManagedBy   = "Terraform"
  }
}
//Application du versionning
resource "aws_s3_bucket_versioning" "tfstate_versioning" {
  bucket = aws_s3_bucket.tfstate.id
  versioning_configuration {
    status = "Enabled"
  }
}
//Cryptage
resource "aws_s3_bucket_server_side_encryption_configuration" "tfstate_encryption" {
  bucket = aws_s3_bucket.tfstate.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
//Permission
resource "aws_s3_bucket_public_access_block" "tfstate_public_acces_block" {
  bucket = aws_s3_bucket.tfstate.id
  
  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}