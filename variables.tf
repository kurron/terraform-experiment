variable "key_name" {
    description = "Name of the SSH keypair to use in AWS."
    default = "aws-linux"
}

variable "security_group" {
    description = "Name of the security group to use."
    default = "inbound"
}

variable "key_path" {
    description = "Path to the private portion of the SSH key specified."
    default = "/home/vagrant/aws/aws-linux.pem"
}

variable "aws_region" {
    description = "AWS region to launch servers."
    default = "us-west-2"
}

# Ubuntu Server 14.04 LTS (HVM), SSD Volume Type (x64)
variable "aws_amis" {
    default = {
        us-west-2 = "ami-5189a661"
    }
}
