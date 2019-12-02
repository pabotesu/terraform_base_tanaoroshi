/*業務用システム用ALB*/
resource "aws_lb" "for-business-alb" {
  name = "for-business-alb"
  load_balancer_type = "application"
  internal = false
  idle_timeout = 60
  enable_deletion_protection = false

  subnets = [
      "${var.for-business-public-subnet-a_id}",
      "${var.for-business-public-subnet-c_id}",
  ] 

  security_groups = [
      "${module.for-business-http-sg.security_group_id}",
      "${module.for-business-https-sg.security_group_id}",
  ]

}

resource "aws_lb_target_group" "for-business-alb-target" {
  name = "for-business-alb-target"
  port = 80
  protocol = "HTTP"
  vpc_id = "${var.for-business-VPC_id}"

  health_check {
    interval = 30
    path = "/index.html"
    port = 80
    protocol = "HTTP"
    unhealthy_threshold = 2
    matcher = 200
  }
}


/*ALB atache*/
resource "aws_alb_target_group_attachment" "for-business-webserver-a" {
  target_group_arn = "${aws_lb_target_group.for-business-alb-target.arn}"
  target_id = "${aws_instance.for-business-webserver-a.id}"
  port = 80
}

resource "aws_alb_target_group_attachment" "for-business-webserver-c" {
  target_group_arn = "${aws_lb_target_group.for-business-alb-target.arn}"
  target_id = "${aws_instance.for-business-webserver-c.id}"
  port = 80
}
  
/*ALB Listen add target group*/ 
resource "aws_alb_listener" "for-business-alb-listen" {
  load_balancer_arn = "${aws_lb.for-business-alb.arn}"
  port = "80"
  protocol = "HTTP"

  default_action{
    target_group_arn = "${aws_lb_target_group.for-business-alb-target.arn}"
    type = "forward"
  }
}

/*ALB_Listen-rule*/
resource "aws_alb_listener_rule" "for-business-alb-listen-rule" {
  listener_arn = "${aws_alb_listener.for-business-alb-listen.arn}"
  priority = 100

  action {
    type = "forward"
    target_group_arn = "${aws_lb_target_group.for-business-alb-target.arn}"  
  }

  condition{
    field = "path-pattern"
    values = ["/target/*"]
  }
}


  output "for-business-alb_dns_name"{
      value = "${aws_lb.for-business-alb.dns_name}" 
  }