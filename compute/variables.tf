variable "aws_region" {
  description = "AWS region"
  default = "us-east-1"
}

variable "ami_id" {
  description = "ID of the AMI to provision. Default is Ubuntu 14.04 Base Image"
  default = "ami-2e1ef954"
}

variable "instance_type" {
  description = "type of EC2 instance to provision."
  default = "t2.micro"
}

variable "name" {
  description = "name to pass to Name tag"
  default = "mattspeters"
}

////////////////////

variable "subnets" {
  description = "subnets"
  default = "subnet-e80da4d9"
}

variable "health_check" {
  default = "HTTP:8200/v1/sys/health?standbyok=true&perfstandbyok=true"
  description = "Health check for load balancer"
}

variable "AWS_ACCESS_KEY_ID" {
  default = ""
  description = "aws access key"
}

variable "AWS_SECRET_ACCESS_KEY" {
  default = ""
  description = "aws access key"
}
