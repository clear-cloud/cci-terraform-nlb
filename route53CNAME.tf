#
# Optional friendly CNAME entry
#
resource "aws_route53_record" "cname" {
  count   = "${var.friendly_name ? 1 : 0}"
  zone_id = "${var.zone_id}"
  name    = "${var.friendly_name}"
  type    = "CNAME"
  ttl     = "300"
  records = ["${aws_lb.alb.dns_name}"]
}
