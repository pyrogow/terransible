variable "aws_region" {
  description = "AWS region on which we will setup the swarm cluster"
  default     = "us-west-2"
}
variable "ami" {
  description = "Amazon Linux AMI"
  default     = "ami-04b762b4289fba92b"
}
variable "instance_type" {
  description = "Instance type"
  default     = "t2.micro"
}
variable "key_path" {
  description = "SSH Public Key path"
  #   default     = "%USERPROFILE%/.ssh/aws-my_laptop.pem"
  default = "/home/oleksandr/.ssh/aws-my_laptop.pem"
}
variable "key_name" {
  description = "Desired name of Keypair..."
  default     = "aws-my_laptop"
}
variable "bootstrap_path" {
  description = "Script to install Docker Engine"
  default     = "install_docker_machine_compose.sh"
}
