terraform {
  backend "s3" {
    bucket         = "bucket-name"
    key            = "terraform/windows-ec2-instance/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
