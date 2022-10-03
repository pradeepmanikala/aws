/*resource "aws_vpc" "testvpc1" {
  cidr_block           = "10.1.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "TestVPC001"
  }
}*/

resource "aws_vpc" "vpc" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    tags = {
        Name = "${var.client}-VPC01"
	Owner = "Pradeep"
	environment = "${var.environment}"
    }
}