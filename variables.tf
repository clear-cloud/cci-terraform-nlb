variable "zone_id" {
  default = ""
}

variable "friendly_name" {
  default = "0"
}

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

variable "healthy_threshold" {
  default = "4"
}

variable "unhealthy_threshold" {
  default = "4"
}

variable "interval" {
  default = "10"
}

# -----------------------------
# Listener 1 Variables 
# -----------------------------
variable "listener1_alb_listener_port" {
  default = "80"
}

variable "listener1_alb_listener_protocol" {
  default = "TCP"
}

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

variable "listener1_target_id" {
  type        = "string"
  description = "ec2 instance(s) id to attach to listener1"
  default     = ""
}

variable "listener1_health_check_protocol" {
  default = "TCP"
}

# -----------------------------
# Listener 2 Variables
# -----------------------------
variable "listener2_alb_listener_port" {
  default = "443"
}

variable "listener2_alb_listener_protocol" {
  default = "TLS"
}

variable "alb_listener2_port" {
  default = "443"
}

variable "alb_listener2_protocol" {
  default = "TLS"
}

variable "listener2_svc_port" {
  default = "443"
}

variable "listener2_target_group_protocol" {
  default = "TCP"
}

variable "listener2_target_id" {
  type        = "string"
  description = "ec2 instance(s) id to attach to listener2"
}

variable "listener2_health_check_protocol" {
  default = "TCP"
}

# -----------------------------
# Listener 3 Variables
# -----------------------------
variable "listener3_alb_listener_port" {
  description = "Optional 3rd listener , set a value here to be created"
  default     = ""
}

variable "listener3_alb_listener_protocol" {
  default = ""
}

variable "alb_listener3_port" {
  default = ""
}

variable "alb_listener3_protocol" {
  default = ""
}

variable "listener3_svc_port" {
  default = "80"
}

variable "listener3_target_group_protocol" {
  default = "TCP"
}

variable "listener3_target_id" {
  type        = "string"
  description = "ec2 instance(s) id to attach to listener3"
  default     = "0"
}

variable "listener3_health_check_protocol" {
  default = "TCP"
}

# -----------------------------
# Listener 4 Variables
# -----------------------------
variable "listener4_alb_listener_port" {
  description = "Optional 4th listener , set a value here to be created"
  default     = ""
}

variable "listener4_alb_listener_protocol" {
  default = ""
}

variable "alb_listener4_port" {
  default = ""
}

variable "alb_listener4_protocol" {
  default = ""
}

variable "listener4_svc_port" {
  default = "80"
}

variable "listener4_target_group_protocol" {
  default = "TCP"
}

variable "listener4_target_id" {
  type        = "string"
  description = "ec2 instance(s) id to attach to listener4"
  default     = "0"
}

variable "listener4_health_check_protocol" {
  default = "TCP"
}

# -----------------------------
# Listener 5 Variables
# -----------------------------
variable "listener5_alb_listener_port" {
  description = "Optional 5th listener , set a value here to be created"
  default     = ""
}

variable "listener5_alb_listener_protocol" {
  default = ""
}

variable "alb_listener5_port" {
  default = ""
}

variable "alb_listener5_protocol" {
  default = ""
}

variable "listener5_svc_port" {
  default = "80"
}

variable "listener5_target_group_protocol" {
  default = "TCP"
}

variable "listener5_target_id" {
  type        = "string"
  description = "ec2 instance(s) id to attach to listener5"
  default     = "0"
}

variable "listener5_health_check_protocol" {
  default = "TCP"
}

# -----------------------------
# Listener 6 Variables
# -----------------------------
variable "listener6_alb_listener_port" {
  description = "Optional 6th listener , set a value here to be created"
  default     = ""
}

variable "listener6_alb_listener_protocol" {
  default = ""
}

variable "alb_listener6_port" {
  default = ""
}

variable "alb_listener6_protocol" {
  default = ""
}

variable "listener6_svc_port" {
  default = "80"
}

variable "listener6_target_group_protocol" {
  default = "TCP"
}

variable "listener6_target_id" {
  type        = "string"
  description = "ec2 instance(s) id to attach to listener6"
  default     = "0"
}

variable "listener6_health_check_protocol" {
  default = "TCP"
}
