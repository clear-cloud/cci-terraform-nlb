# -------------------
# Listener1
# -------------------
resource "aws_alb_listener" "alb_listener" {
  load_balancer_arn = "${aws_lb.alb.arn}"
  port              = "${var.alb_listener_port}"
  protocol          = "${var.alb_listener_protocol}"

  default_action {
    target_group_arn = "${aws_lb_target_group.alb_target_group.arn}"
    type             = "forward"
  }
}

# -------------------
# Listener1 - Target Group
# -------------------
resource "aws_lb_target_group" "alb_target_group" {
  name     = "${var.name}-${var.environment}-target-group"
  port     = "${var.listener1_svc_port}"
  protocol = "${var.listener1_target_group_protocol}"
  vpc_id   = "${var.vpc_id}"

  health_check {
    healthy_threshold   = "${var.healthy_threshold}"
    unhealthy_threshold = "${var.unhealthy_threshold}"
    timeout             = "${var.timeout}"
    interval            = "${var.interval}"
    matcher             = "${var.listener1_success_codes}"

    path = "${var.target_group_path}"
  }
}

# -------------------
# Listener1 - Target Group Attachment
# -------------------
resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = "${aws_lb_target_group.test.arn}"
  target_id        = "${aws_instance.test.id}"
  port             = 80
}
