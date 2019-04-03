#
# Listener1
#
resource "aws_alb_listener" "alb_listener" {
  load_balancer_arn = "${aws_lb.alb.arn}"
  port              = "${var.alb_listener_port}"
  protocol          = "${var.alb_listener_protocol}"

  default_action {
    target_group_arn = "${aws_lb_target_group.alb_target_group.arn}"
    type             = "forward"
  }
}
