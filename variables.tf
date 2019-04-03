variable "subnets" {
  description = "A list of subnets to associate with the load balancer. e.g. ['subnet-1a2b3c4d','subnet-1a2b3c4e','subnet-1a2b3c4f']"
  type        = "list"
}

variable "cidr_blocks" {
  default = "0.0.0.0/0"
}

variable "vpc_id" {}

variable "load_balancer_type" {
  default = "network"
}

variable "alb_allowed_ports" {
  default = "443"
}

#variable "subnetA" {}
#variable "subnetB" {}

variable "enable_deletion_protection" {
  default = "false"
}

variable "contact" {}

variable "orchestration" {}

variable "internal" {
  default = "true"
}

variable "environment" {}
variable "name" {}

variable "enable_cross_zone_load_balancing" {
  default = "true"
}

# Listener port and protocol need to match
variable "alb_listener_port" {
  default = "443"
}

variable "alb_listener_protocol" {
  default = "HTTPS"
}

variable "healthy_threshold" {
  default = "4"
}

variable "unhealthy_threshold" {
  default = "4"
}

variable "timeout" {
  default = "5"
}

variable "interval" {
  default = "10"
}

variable "target_group_path" {
  default = "/"
}

# -----------------------------
# Listener 1 Variables 
# -----------------------------
variable "alb_listener1_port" {
  default = "80"
}

variable "alb_listener1_protocol" {
  default = "HTTP"
}

variable "listener1_svc_port" {
  default = "80"
}

variable "listener1_target_group_protocol" {
  default = "TCP"
}

variable "listener1_success_codes" {
  default = "200"
}

variable "listener1_target_id" {
  description = "ec2 instance(s) id to attach to listener1"
}

variable "listener1_health_check_protocol" {
  default = "TCP"
}
