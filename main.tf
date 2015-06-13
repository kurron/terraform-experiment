# Specify the provider and access details
provider "aws" {
    # we'll source it from AWS_ACCESS_KEY_ID in the environment
#   access_key = "${var.aws_access_key}"
    # we'll source it from AWS_SECRET_ACCESS_KEY in the environment
#   secret_key = "${var.aws_secret_key}"
    region = "${var.aws_region}"
    max_retries = 10
}

resource "aws_security_group" "composable" {
    name = "composable"
    description = "Firewall rules to allow provisioning and application deployment"

    tags {
        realm = "experimental"
        created-by = "Terraform"
        direction = "bi-dierectional"
        purpose = "application"
    }
}

resource "aws_security_group_rule" "inbound-ssh" {
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

    security_group_id = "${aws_security_group.composable.id}"
}

resource "aws_security_group_rule" "inbound-docker" {
    type = "ingress"
    from_port = 2375
    to_port = 2375
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

    security_group_id = "${aws_security_group.composable.id}"
}

resource "aws_security_group_rule" "inbound-http" {
    type = "ingress"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

    security_group_id = "${aws_security_group.composable.id}"
}

resource "aws_security_group_rule" "inbound-https" {
    type = "ingress"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

    security_group_id = "${aws_security_group.composable.id}"
}

resource "aws_security_group_rule" "allow-all-outbound" {
    type = "egress"
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

    security_group_id = "${aws_security_group.composable.id}"
}

resource "aws_instance" "docker" {
    connection {
        user = "ubuntu"
        key_file = "${var.key_path}"
    }

    ami = "${lookup(var.aws_amis, var.aws_region)}"

#   availability_zone = "optional"
#   placement_group = "optional"
#   ebs_optimized = true 
#   disable_api_termination = false 

    instance_type = "${var.instance_type}"
    key_name = "${var.key_name}"
    security_groups = ["${aws_security_group.composable.name}"]

#   vpc_security_group_ids = []
#   subnet_id = "optional" 
#   associate_public_ip_address = true 
#   private_ip = "192.168.1.2" 
#   source_dest_check = true 
#   user_data = "optional" 
#   iam_instance_profile = "optional" 
    tags {
        realm = "experimental"
        purpose = "docker-container"
        created-by = "Terraform"
    }
#   root_block_device = "optional" 
#   ebs_block_device = "optional" 
#   ephemeral_block_device = "optional" 

    # run Ansible to provision the box
    provisioner "local-exec" {
        command = "./provision-instance.sh ${aws_instance.docker.public_ip}"
    }
}

resource "aws_elb" "load-balancer" {
  name = "load-balancer"
  availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]

  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "HTTP:80/"
    interval = 30
  }

  instances = ["${aws_instance.docker.id}"]
  cross_zone_load_balancing = true
  idle_timeout = 400
  connection_draining = true
  connection_draining_timeout = 400
}
