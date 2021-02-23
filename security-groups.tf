resource "aws_security_group" "sgswarm" {
  name = "sgswarm"
  tags = {
    Name = "sgswarm"
  }
  # Allow all inbound
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Enable ICMP
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


# provider "aws" {
# }

# resource "aws_vpc" "main" {
#   cidr_block           = "10.95.0.0/16"
#   enable_dns_hostnames = true
# }

# resource "aws_internet_gateway" "main" {
#   vpc_id = "${aws_vpc.main.id}"
# }

# resource "aws_route" "internet_access" {
#   route_table_id         = "${aws_vpc.main.main_route_table_id}"
#   destination_cidr_block = "0.0.0.0/0"
#   gateway_id             = "${aws_internet_gateway.main.id}"
# }

# resource "aws_security_group" "exposed" {
#   name        = "exposed"
#   vpc_id      = "${aws_vpc.main.id}"

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

# }

# resource "aws_eip" "managers" {
#   count    = "2"
#   instance = "${module.docker-swarm.manager_instance_ids[count.index]}"
#   vpc      = true
# }

# output "manager_ip_addresses" {
#   value = "${aws_eip.managers.*.public_ip}"
# }
