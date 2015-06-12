variable "key_name" {
    description = "Name of the SSH keypair to use in AWS."
    default = "aws-linux"
}

variable "security_group" {
    description = "Name of the security group to use."
    default = "Container Service"
}

variable "key_path" {
    description = "Path to the private portion of the SSH key specified."
    default = "/home/vagrant/aws/aws-linux.pem"
}

variable "aws_region" {
    description = "AWS region to launch servers."
    default = "us-west-2"
}

# Ubuntu Server 14.04 LTS (PV), SSD Volume Type, 64-bit 
variable "aws_amis" {
    default = {
        us-east-1 = "ami-6989a659"
        us-west-1 = "ami-6989a659"
        us-west-2 = "ami-6989a659"
    }
}
