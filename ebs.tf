#this block is used for creating EBS volumes of 2GB.
resource "aws_ebs_volume" "ebs-public-servers" {
    availability_zone = element(var.azs,count.index)  
    count = length(var.publicsubnets)
    size              = 2   
    
    tags = {
      Name = "${aws_vpc.vpc.tags.Name}-EBS-publicserver-${count.index+1}"
    }
}

#this block is used for attaching EBS volumes to public servers.
resource "aws_volume_attachment" "ebs_att" {
    count = length(var.publicsubnets)
    device_name = "/dev/sdh"
    volume_id   = element(aws_ebs_volume.ebs-public-servers.*.id, count.index)
    instance_id = element(aws_instance.webserver-public.*.id, count.index)
}
