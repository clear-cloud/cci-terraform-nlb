# -------------------
# Listener3
# -------------------
resource "aws_alb_listener" "l3_alb_listener" {
  count             = "${var.listener3_alb_listener_port != "" ? 1 : 0}"
  load_balancer_arn = "${aws_lb.alb.arn}"
  port              = "${var.listener3_alb_listener_port}"
  protocol          = "${var.listener3_alb_listener_protocol}"

  default_action {
    target_group_arn = "${aws_lb_target_group.l3_alb_target_group.arn}"
    type             = "forward"
  }
}

# -------------------
# Listener3 - Target Group
# -------------------
resource "aws_lb_target_group" "l3_alb_target_group" {
  count    = "${var.listener3_alb_listener_port != "" ? 1 : 0}"
  name     = "${var.name}-${var.environment}-tg-listener3-${var.listener3_svc_port}"
  port     = "${var.listener3_svc_port}"
  protocol = "${var.listener3_target_group_protocol}"
  vpc_id   = "${var.vpc_id}"

  health_check {
    healthy_threshold   = "${var.healthy_threshold}"
    unhealthy_threshold = "${var.unhealthy_threshold}"
    interval            = "${var.interval}"
    protocol            = "${var.listener1_health_check_protocol}"
  }

  stickiness = [] # NLBs have to have stickiness disabled
}

# -------------------
# Listener3 - Target Group Attachment
# -------------------
resource "aws_lb_target_group_attachment" "l3_target_group" {
  count            = "${var.listener3_target_id != "0" ? length(split(",", var.listener3_target_id)) : 0}"
  target_group_arn = "${aws_lb_target_group.l3_alb_target_group.arn}"
  target_id        = "${element(split(",",var.listener3_target_id), count.index)}"
  port             = "${var.listener3_svc_port}"
}
