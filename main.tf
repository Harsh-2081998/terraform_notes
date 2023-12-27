provider "aws" {
 	region = "us-east-1"
}

data "aws_subnet" "selected" {
 	filter {
	 name = "tag:Name"
	 values = ["Subnet_1"]
}
}

resource "aws_instance" "ec2_1" {
	ami = "ami-0c7217cdde317cfec"
	instance_type = "t2.micro"
	subnet_id = data.aws_subnet.selected.id
	key_name = "ec2_keypair"
	tags = {
	Name = "EC2_instance"
}
}
