resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${aws_vpc.vpc.tags.Name}-IGW"
  }
}