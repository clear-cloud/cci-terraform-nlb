#
# Create ALB
#

resource "aws_lb" "alb" {
  name               = "${var.name}-${var.environment}"
  internal           = "${var.internal}"
  load_balancer_type = "${var.load_balancer_type}"

  #subnets            = ["${var.subnetA}", "${var.subnetB}"]
  subnets = ["${var.subnets}"]

  enable_deletion_protection = "${var.enable_deletion_protection}"

  #-----------------------------------------------------------------
  # Tags
  #-----------------------------------------------------------------
  tags {
    Name            = "${var.name}-${var.environment}"
    "Environment"   = "${var.environment}"
    "Contact"       = "${var.contact}"
    "Orchestration" = "${var.orchestration}"
  }
}
