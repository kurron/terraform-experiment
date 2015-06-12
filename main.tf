# Specify the provider and access details
provider "aws" {
    # we'll source it from AWS_ACCESS_KEY_ID in the environment
#   access_key = "${var.aws_access_key}"
    # we'll source it from AWS_SECRET_ACCESS_KEY in the environment
#   secret_key = "${var.aws_secret_key}"
    region = "${var.aws_region}"
    max_retries = 10
}

resource "aws_security_group" "inbound-ssh" {
    name = "inbound-ssh"
    description = "SSH in, nothing out"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags {
        direction = "inbound"
        reason = "provisioning"
    }
    # Terraform, by default, removes the ALLOW_ALL rule so we don't have to specify it here 
}

resource "aws_security_group" "inbound-insecure-http" {
    name = "inbound-insecure-http"
    description = "HTTP in, nothing out"
    
    ingress {
        from_port = 80 
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
    tags {
        direction = "inbound"
        reason = "application"
    }
    # Terraform, by default, removes the ALLOW_ALL rule so we don't have to specify it here
} 

resource "aws_security_group" "inbound-secure-http" {
    name = "inbound-secure-http"
    description = "HTTPS in, nothing out"
   
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
 
    tags {
        direction = "inbound"
        reason = "application"
    }
    # Terraform, by default, removes the ALLOW_ALL rule so we don't have to specify it here
}

resource "aws_instance" "docker" {
  connection {
    # The default username for our AMI
    user = "ubuntu"

    # The path to your keyfile
    key_file = "${var.key_path}"
  }

  # Lookup the correct AMI based on the region
  # we specified
  ami = "${lookup(var.aws_amis, var.aws_region)}"

# availability_zone = "optional"
# placement_group = "optional"
# ebs_optimized = true 
# disable_api_termination = false 

  instance_type = "t1.micro"
  key_name = "${var.key_name}"
  security_groups = ["${aws_security_group.inbound-ssh.name}",
                     "${aws_security_group.inbound-insecure-http.name}",
                     "${aws_security_group.inbound-secure-http.name}"]

# vpc_security_group_ids = []
# subnet_id = "optional" 
# associate_public_ip_address = true 
# private_ip = "192.168.1.2" 
# source_dest_check = true 
# user_data = "optional" 
# iam_instance_profile = "optional" 
  tags {
      realm = "experimental"
      purpose = "docker-container"
      created-by = "Terraform"
  }
# root_block_device = "optional" 
# ebs_block_device = "optional" 
# ephemeral_block_device = "optional" 

}
