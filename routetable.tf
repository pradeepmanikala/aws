resource "aws_route_table" "route-public" {
    vpc_id = "${aws_vpc.vpc.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.igw.id}"
    }

    tags = {
        Name = "${aws_vpc.vpc.tags.Name}-publicRT"
    }
}

resource "aws_route_table" "route-private" {
    vpc_id = "${aws_vpc.vpc.id}"
    tags = {
        Name = "${aws_vpc.vpc.tags.Name}-privateRT"
    }
}

resource "aws_route_table_association" "route-public-association" {
    count = length(var.publicsubnets)
    subnet_id = element(aws_subnet.subnet-public.*.id,count.index)
    route_table_id = "${aws_route_table.route-public.id}"
}

resource "aws_route_table_association" "route-private-association" {
    count = length(var.publicsubnets)
    subnet_id = element(aws_subnet.subnet-private.*.id,count.index)
    route_table_id = "${aws_route_table.route-private.id}"
}