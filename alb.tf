#
# Create ALB
#

resource "aws_lb" "alb" {
  name               = "${var.name}-${var.environment}"
  internal           = "${var.internal}"
  load_balancer_type = "${var.load_balancer_type}"
  security_groups    = ["${aws_security_group.alb_sg.id}"]

  #subnets            = ["${var.subnetA}", "${var.subnetB}"]
  subnets = ["${var.subnets}"]

  enable_deletion_protection = "${var.enable_deletion_protection}"

  #-----------------------------------------------------------------
  # Tags
  #-----------------------------------------------------------------
  tags {
    Name            = "${var.environment}_jenkins_ec2"
    "Environment"   = "${var.environment}"
    "Contact"       = "${var.contact}"
    "Orchestration" = "${var.orchestration}"
  }
}
