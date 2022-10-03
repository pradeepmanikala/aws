resource "aws_instance" "webserver-public" {
    count = length(var.publicsubnets)
    ami           = var.image
    instance_type = "t2.micro"
    #availability_zone = "us-east-1a"
    key_name = "AWS-pradeep"
    subnet_id = element(aws_subnet.subnet-public.*.id,count.index)
    vpc_security_group_ids =["${aws_security_group.allow_all.id}"]
    associate_public_ip_address = true
     tags = {
        Name = "${aws_vpc.vpc.tags.Name}-publicserver-${count.index+1}"
    }

    user_data = <<-EOF
		#!/bin/bash
        sudo apt-get update
		sudo apt-get install -y nginx jq
		echo "<h1>${aws_vpc.vpc.tags.Name}-publicserver-${count.index+1}</h1>" | sudo tee //var/www/html/index.nginx-debian.html
	EOF

}   