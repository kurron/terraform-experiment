variable "key_name" {
    description = "Name of the SSH keypair to use in AWS."
    default = {
        us-east-1 = "us-east-1"
        us-west-1 = "do-not-have-one-yet"
        us-west-2 = "aws-linux"
    }
}

variable "key_path" {
    description = "Path to the private portion of the SSH key specified."
    default = {
        us-east-1 = "/home/vagrant/aws/us-east-1.pem"
        us-west-1 = "do-not-have-one-yet"
        us-west-2 = "/home/vagrant/aws/aws-linux.pem"
    }
}

variable "aws_region" {
    description = "AWS region to launch servers."
    default = "us-west-2"
}

variable "instance_type" {
    description = "AWS EC2 instance type."
    default = "t2.micro"
}

# Ubuntu Server 14.04 LTS (HVM), SSD Volume Type, 64-bit 
variable "aws_amis" {
    default = {
        us-east-1 = "ami-5189a661"
        us-west-1 = "ami-5189a661"
        us-west-2 = "ami-5189a661"
    }
}
