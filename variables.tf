variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {} 

variable "client" {}

variable "vpc_cidr" {
    type = string
    default = "10.1.0.0/16"
}
variable "image" {}
variable "publicsubnets" {}
variable "privatesubnets" {}
variable "environment" { default = "dev" }
variable "azs" {}
