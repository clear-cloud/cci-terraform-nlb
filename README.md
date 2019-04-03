# cci-terraform-alb
Creates and ALB.

# Usage Notes
* Currently this module is used to created a Network load balancer "NLB"
* 2 listeners are created by default: 80 and 443.
* There are 4 additional, optional, listeners that can be deployed by using a block such as:

```
  # ----------
  # Listener3 - Optional, enabled by adding the below:
  # ----------
  listener3_alb_listener_port     = "5570"
  listener3_alb_listener_protocol = "TCP"
  alb_listener3_port              = "5570"
  alb_listener3_protocol          = "TCP"
  listener3_target_id             = "i-02e70c5d7f33b04bc"
  listener3_svc_port              = "5570"
  # ----------
  # Listener4 - Optional, enabled by adding the below:
  # ----------
  listener4_alb_listener_port     = "8777"
  listener4_alb_listener_protocol = "TCP"
  alb_listener4_port              = "8777"
  alb_listener4_protocol          = "TCP"
  listener4_target_id             = "i-02e70c5d7f33b04bc"
  listener4_svc_port              = "8777"
  # ----------
  # Listener5 - Optional, enabled by adding the below:
  # ----------
  listener5_alb_listener_port     = "17541"
  listener5_alb_listener_protocol = "TCP"
  alb_listener5_port              = "17541"
  alb_listener5_protocol          = "TCP"
  listener5_target_id             = "i-02e70c5d7f33b04bc"
  listener5_svc_port              = "17541"
  # ----------
  # Listener6 - Optional, enabled by adding the below:
  # ----------
  listener6_alb_listener_port     = "17551"
  listener6_alb_listener_protocol = "TCP"
  alb_listener6_port              = "17551"
  alb_listener6_protocol          = "TCP"
  listener6_target_id             = "i-02e70c5d7f33b04bc"
  listener6_svc_port              = "17551"
```
 
