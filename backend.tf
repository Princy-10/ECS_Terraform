###Store the terraform state file in s3 and lock with Dynamo db
terraform {
  backend "s3" {
    bucket         = "value"
    key            = "Terraform-module/ecs-terraform/terraform.tfstate"
    region         =  "us-east-1"
    profile        = "Terraform-user"
    dynamodb_table = "terraform-state-lock"
  }
}