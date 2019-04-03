# -------------------
# Listener1
# -------------------
resource "aws_alb_listener" "l1_alb_listener" {
  load_balancer_arn = "${aws_lb.alb.arn}"
  port              = "${var.alb_listener_port}"
  protocol          = "${var.alb_listener_protocol}"

  default_action {
    target_group_arn = "${aws_lb_target_group.l1_alb_target_group.arn}"
    type             = "forward"
  }
}

# -------------------
# Listener1 - Target Group
# -------------------
resource "aws_lb_target_group" "l1_alb_target_group" {
  name     = "${var.name}-${var.environment}-tg-listener1"
  port     = "${var.listener1_svc_port}"
  protocol = "${var.listener1_target_group_protocol}"
  vpc_id   = "${var.vpc_id}"

  health_check {
    healthy_threshold   = "${var.healthy_threshold}"
    unhealthy_threshold = "${var.unhealthy_threshold}"
    timeout             = "${var.timeout}"
    interval            = "${var.interval}"
    protocol            = "${var.listener1_health_check_protocol}"

    path = "${var.target_group_path}"
  }

  #stickiness {
  # enabled = "false" # NLBs have to have stickiness disabled
  #}
  stickiness = [] # NLBs have to have stickiness disabled
}

# -------------------
# Listener1 - Target Group Attachment
# -------------------
resource "aws_lb_target_group_attachment" "l1_target_group" {
  count            = "${length(split(",", var.listener1_target_id))}"
  target_group_arn = "${aws_lb_target_group.l1_alb_target_group.arn}"
  target_id        = "${element(split(",",var.listener1_target_id), count.index)}"
  port             = "${var.listener1_svc_port}"
}
