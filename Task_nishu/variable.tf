variable "ami_id" {
  description = "The ID of the Windows AMI to use"
  default     = "ami-value"  
}

variable "instance_type" {
  description = "The instance type to use"
  default     = "t2.micro" 
}

variable "key_name" {
  description = "The name of the SSH key pair"
  default     = "test" 
}

variable "availability_zone" {
  description = "The AWS availability zone"
  default     = "us-east-1a" 
}
