variable "name" {}
variable "vpc_id" {}
variable "port" {}
variable "in-sg" {}

resource "aws_security_group" "webserver" {
  name = "${var.name}"
  vpc_id = "${var.vpc_id}"
    tags ={
    Name = "${var.name}"
  }
}

resource "aws_security_group_rule" "ingress" {
  type = "ingress"
  from_port = "${var.port}"
  to_port = "${var.port}"
  protocol = "tcp"
  source_security_group_id = "${var.in-sg}"
  security_group_id = "${aws_security_group.webserver.id}"
}

resource "aws_security_group_rule" "egress" {
  type = "egress"
  from_port = "0"
  to_port = "0"
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.webserver.id}"
}

output "security_group_id" {
  value = "${aws_security_group.webserver.id}"
}