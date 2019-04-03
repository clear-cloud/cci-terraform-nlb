# -------------------
# Listener4
# -------------------
resource "aws_alb_listener" "l4_alb_listener" {
  count             = "${var.listener4_alb_listener_port != "" ? 1 : 0}"
  load_balancer_arn = "${aws_lb.alb.arn}"
  port              = "${var.listener4_alb_listener_port}"
  protocol          = "${var.listener4_alb_listener_protocol}"

  default_action {
    target_group_arn = "${aws_lb_target_group.l4_alb_target_group.arn}"
    type             = "forward"
  }
}

# -------------------
# Listener4 - Target Group
# -------------------
resource "aws_lb_target_group" "l4_alb_target_group" {
  count    = "${var.listener3_alb_listener_port != "" ? 1 : 0}"
  name     = "${var.name}-${var.environment}-tg-listener4-${var.listener4_svc_port}"
  port     = "${var.listener4_svc_port}"
  protocol = "${var.listener4_target_group_protocol}"
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
# Listener4 - Target Group Attachment
# -------------------
resource "aws_lb_target_group_attachment" "l4_target_group" {
  count            = "${var.listener4_target_id != "0" ? length(split(",", var.listener4_target_id)) : 0}"
  target_group_arn = "${aws_lb_target_group.l4_alb_target_group.arn}"
  target_id        = "${element(split(",",var.listener4_target_id), count.index)}"
  port             = "${var.listener4_svc_port}"
}




