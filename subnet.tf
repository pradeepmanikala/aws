resource "aws_subnet" "subnet-public" {
    #count value starts from 0,1,2
    #count = 3
    count = length(var.publicsubnets)
    vpc_id = "${aws_vpc.vpc.id}"
    cidr_block = element(var.publicsubnets,count.index)
    availability_zone = element(var.azs,count.index)

    tags = {
        Name = "${aws_vpc.vpc.tags.Name}-public-${count.index+1}"
    }
}

resource "aws_subnet" "subnet-private" {
    count = length(var.privatesubnets)
    vpc_id = "${aws_vpc.vpc.id}"
    cidr_block = element(var.privatesubnets,count.index)
    availability_zone = element(var.azs,count.index)

    tags = {
        Name = "${aws_vpc.vpc.tags.Name}-private-${count.index+1}"
    }
}

