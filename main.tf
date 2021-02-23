# Specify the provider and access details
provider "aws" {
  # shared_credentials_file = "%USERPROFILE%/.aws/credentials"
  shared_credentials_file = "/mnt/c/Users/CEHATOP/.aws/credentials"
  region                  = "${var.aws_region}"
}

resource "aws_instance" "nginx" {
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name      = "${var.key_name}"
  # user_data              = "${file("${var.bootstrap_path}")}"
  vpc_security_group_ids = ["${aws_security_group.sgswarm.id}"]
  tags = {
    Name = "nginx"
  }
}
resource "aws_instance" "manager" {
  ami                    = "${var.ami}"
  instance_type          = "${var.instance_type}"
  key_name               = "${var.key_name}"
  user_data              = "${file("${var.bootstrap_path}")}"
  vpc_security_group_ids = ["${aws_security_group.sgswarm.id}"]
  tags = {
    Name        = "manager"
    Environment = "swarm_mashines"
  }
}
resource "aws_instance" "worker1" {
  ami                    = "${var.ami}"
  instance_type          = "${var.instance_type}"
  key_name               = "${var.key_name}"
  user_data              = "${file("${var.bootstrap_path}")}"
  vpc_security_group_ids = ["${aws_security_group.sgswarm.id}"]
  tags = {
    Name        = "worker1"
    Environment = "swarm_mashines"
  }
}
# resource "aws_instance" "worker2" {
#   ami                    = "${var.ami}"
#   instance_type          = "${var.instance_type}"
#   key_name               = "${var.key_name}"
#   user_data              = "${file("${var.bootstrap_path}")}"
#   vpc_security_group_ids = ["${aws_security_group.sgswarm.id}"]
#   tags {
#     Name = "worker 2"
#   }
# }
