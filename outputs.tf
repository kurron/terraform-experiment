
output "docker1_id" {
  value = "${aws_instance.docker1.id}"
}

output "docker1_az" {
  value = "${aws_instance.docker1.availability_zone}"
}

output "docker1_key" {
  value = "${aws_instance.docker1.key_name}"
}

output "docker1_private_ip" {
  value = "${aws_instance.docker1.private_ip}"
}

output "docker1_public_dns" {
  value = "${aws_instance.docker1.public_dns}"
}

output "docker1_public_ip" {
  value = "${aws_instance.docker1.public_ip}"
}

output "docker1_subnet_id" {
  value = "${aws_instance.docker1.subnet_id}"
}

output "docker2_id" {
  value = "${aws_instance.docker2.id}"
}

output "docker2_az" {
  value = "${aws_instance.docker2.availability_zone}"
}

output "docker2_key" {
  value = "${aws_instance.docker2.key_name}"
}

output "docker2_private_ip" {
  value = "${aws_instance.docker2.private_ip}"
}

output "docker2_public_dns" {
  value = "${aws_instance.docker2.public_dns}"
}

output "docker2_public_ip" {
  value = "${aws_instance.docker2.public_ip}"
}

output "docker2_subnet_id" {
  value = "${aws_instance.docker2.subnet_id}"
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

output "website_id" {
  value = "${aws_s3_bucket.web-site.id}"
}

output "website_hosted_zone_id" {
  value = "${aws_s3_bucket.web-site.hosted_zone_id}"
}

output "website_region" {
  value = "${aws_s3_bucket.web-site.region}"
}

output "website_endpoint" {
  value = "${aws_s3_bucket.web-site.website_endpoint}"
}

output "sqs_id" {
  value = "${aws_sqs_queue.example_queue.id}"
}

output "sqs_arn" {
  value = "${aws_sqs_queue.example_queue.arn}"
}

output "sns_id" {
  value = "${aws_sns_topic.example_topic.id}"
}


output "sns_arn" {
  value = "${aws_sns_topic.example_topic.arn}"
}

output "mysql_id" {
  value = "${aws_db_instance.mysql.id}"
}

output "mysql_address" {
  value = "${aws_db_instance.mysql.address}"
}

output "mysql_storage" {
  value = "${aws_db_instance.mysql.allocated_storage}"
}

output "mysql_az" {
  value = "${aws_db_instance.mysql.availability_zone}"
}

output "mysql_backup_retention_period" {
  value = "${aws_db_instance.mysql.backup_retention_period}"
}

output "mysql_backup_window" {
  value = "${aws_db_instance.mysql.backup_window}"
}

output "mysql_endpoint" {
  value = "${aws_db_instance.mysql.endpoint}"
}

output "mysql_engine" {
  value = "${aws_db_instance.mysql.engine}"
}

output "mysql_engine_version" {
  value = "${aws_db_instance.mysql.engine_version}"
}

output "mysql_instance_class" {
  value = "${aws_db_instance.mysql.instance_class}"
}

output "mysql_maintenance_windows" {
  value = "${aws_db_instance.mysql.maintenance_window}"
}

output "mysql_multi_az" {
  value = "${aws_db_instance.mysql.multi_az}"
}

output "mysql_name" {
  value = "${aws_db_instance.mysql.name}"
}

output "mysql_port" {
  value = "${aws_db_instance.mysql.port}"
}

output "mysql_status" {
  value = "${aws_db_instance.mysql.status}"
}

output "mysql_username" {
  value = "${aws_db_instance.mysql.username}"
}

output "mysql_storage_encrypted" {
  value = "${aws_db_instance.mysql.storage_encrypted}"
}

