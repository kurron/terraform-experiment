variable "aws_region" {
    description = "AWS region to launch servers."
    default = "us-west-2"
}

variable "instance_type" {
    description = "AWS EC2 instance type."
    default = "t2.micro"
}

variable "key_name" {
    description = "Name of the SSH keypair to use in AWS."
    default = {
        us-east-1 = "us-east-1"
        us-west-1 = "us-west-1"
        us-west-2 = "us-west-2"
    }
}

variable "key_path" {
    description = "Path to the private portion of the SSH key specified."
    default = {
        us-east-1 = "/home/vagrant/aws/us-east-1.pem"
        us-west-1 = "/home/vagrant/aws/us-west-1.pem"
        us-west-2 = "/home/vagrant/aws/us-west-2.pem"
    }
}

# Ubuntu Server 14.04 LTS (HVM), SSD Volume Type, 64-bit 
variable "aws_amis" {
    description = "AMI to build the instance from."
    default = {
        us-east-1 = "ami-d05e75b8"
        us-west-1 = "ami-df6a8b9b"
        us-west-2 = "ami-5189a661"
    }
}

