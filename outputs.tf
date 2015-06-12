
output "id" {
  value = "${aws_instance.docker.id}"
}

output "az" {
  value = "${aws_instance.docker.availability_zone}"
}

output "placement" {
  value = "${aws_instance.docker.placement_group}"
}

output "key" {
  value = "${aws_instance.docker.keyname}"
}

output "private_ip" {
  value = "${aws_instance.docker.private_ip}"
}

output "public_dns" {
  value = "${aws_instance.docker.public_dns}"
}

output "public_ip" {
  value = "${aws_instance.docker.public_ip}"
}

output "security_groups" {
  value = "${aws_instance.docker.security_groups}"
}

output "vpc_security_group_ids" {
  value = "${aws_instance.docker.vpc_security_group_ids}"
}

output "subnet_id" {
  value = "${aws_instance.docker.subnet_id}"
}

