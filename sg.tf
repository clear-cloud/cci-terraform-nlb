resource "aws_security_group" "alb_sg" {
  name        = "${var.environment}.${var.name}.alb.sg"
  description = "${var.environment} ${var.name} ALB SG"
  vpc_id      = "${var.vpc_id}"

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    "Name"          = "${var.environment}_${var.name}_alb_sg"
    "Environment"   = "${var.environment}"
    "Contact"       = "${var.contact}"
    "Orchestration" = "${var.orchestration}"
  }
}

#
# Loop sg_allowed_ports to allow inbound ports
#
resource "aws_security_group_rule" "rule" {
  count       = "${length(split(",",var.alb_allowed_ports))}"
  type        = "ingress"
  from_port   = "${element(split(",", var.alb_allowed_ports), count.index)}"
  to_port     = "${element(split(",", var.alb_allowed_ports), count.index)}"
  protocol    = "TCP"
  cidr_blocks = ["${var.cidr_blocks}"]

  security_group_id = "${aws_security_group.alb_sg.id}"
}
