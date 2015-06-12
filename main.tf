# Specify the provider and access details
provider "aws" {
    # we'll source it from AWS_ACCESS_KEY_ID in the environment
#   access_key = "${var.aws_access_key}"
    # we'll source it from AWS_SECRET_ACCESS_KEY in the environment
#   secret_key = "${var.aws_secret_key}"
    region = "${var.aws_region}"
    max_retries = 10
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
  security_groups = ["${var.security_group}"]

# vpc_security_group_ids = []
# subnet_id = "optional" 
# associate_public_ip_address = true 
# private_ip = "192.168.1.2" 
# source_dest_check = true 
# user_data = "optional" 
# iam_instance_profile = "optional" 
# tags = "optional" 
# root_block_device = "optional" 
# ebs_block_device = "optional" 
# ephemeral_block_device = "optional" 

}
