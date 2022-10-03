#This Terraform Code Deploys Basic VPC Infra.
provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region 
  /*access_key = "XXXXXXX"
  secret_key = "XXXXXXXXX"
  region     = "us-west-1"*/
}

terraform {
  required_version = "<= 1.2.2" #Forcing which version of Terraform needs to be used
  #required_version = "1.2.2" # Here we are mentioning to use specific version
  required_providers {
    aws = {
      version = "<= 3.0.0" #Forcing which version of plugin needs to be used.
      source  = "hashicorp/aws"
    }
  }
}

/*# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}*/
