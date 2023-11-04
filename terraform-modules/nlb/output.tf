output "nlb_arn" {
  value = "${aws_lb.nlb_1.*.id}"
}

output "nlb_dns_name" {
  value = "${aws_lb.nlb_1.*.dns_name}"
}

output "nlb_listener_id" {
  value = "${aws_lb_listener.nlb_listener_1.*.id}"
}

output "target_group_id" {
  value = "${aws_lb_target_group.target_group_nlb.*.id}"
}

