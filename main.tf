provider "aws" {
  region                   = "ap-northeast-1"
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "The ID of the AMI to use for the EC2 instance"
  type        = string
  default     = "ami-07c589821f2b353aa"
}

variable "subnet_id" {
  description = "The ID of the subnet to launch the EC2 instance in"
  type        = string
  default     = "subnet-01136e2eaaa0cfcb5"
}

variable "security_group_ids" {
  description = "A list of security group IDs to associate with the EC2 instance"
  type        = list(string)
  default     = ["sg-06ec672f8d33c1464"]
}

resource "aws_instance" "ec2_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids

  tags = {
    Name = "EC2 Instance Demo"
  }
}

output "public_ip" {
  value = aws_instance.ec2_instance.public_ip
}
