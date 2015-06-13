
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

output "elb_id" {
  value = "${aws_elb.load-balancer.id}"
}

output "elb_name" {
  value = "${aws_elb.load-balancer.name}"
}

output "elb_dns_name" {
  value = "${aws_elb.load-balancer.dns_name}"
}

output "elb_instances" {
  value = "${aws_elb.load-balancer.instances}"
}

output "elb_source_security_group" {
  value = "${aws_elb.load-balancer.source_security_group}"
}

output "elb_zone_id" {
  value = "${aws_elb.load-balancer.zone_id}"
}

