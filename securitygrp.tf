resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic"
  vpc_id      = "${aws_vpc.vpc.id}"


#protocol - (Required) Protocol. If you select a protocol of "-1" (semantically equivalent to all, 
# which is not a valid value here), you must specify a from_port and to_port equal to 0. If not icmp, 
#tcp, udp, or -1 use the protocol number.
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    }
  tags = {
    Name = "${aws_vpc.vpc.tags.Name}-SG"
  }
}