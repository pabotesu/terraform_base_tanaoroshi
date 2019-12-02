/*社内ウェブサーバインスタンス*/
resource "aws_instance" "in-house-webserver-a" {
  ami = "${lookup(var.in-house-webserver-config, "ami")}"
  instance_type = "${lookup(var.in-house-webserver-config, "instance_type")}"
  key_name = "${lookup(var.in-house-webserver-config, "instance_key")}"
  vpc_security_group_ids = [
      "${module.in-house-http-sg.security_group_id}",
      "${module.in-house-https-sg.security_group_id}",
      "${module.in-house-ssh-sg.security_group_id}",
      "${module.in-house-mysql-sg.security_group_id}",
  ]
  subnet_id = "${var.in-house-public-subnet-a_id}"
  associate_public_ip_address = "true"
  root_block_device  {
      volume_type = "${lookup(var.in-house-webserver-config, "root_ebs_type")}"
      volume_size = "${lookup(var.in-house-webserver-config, "root_ebs_size")}"
  }
  ebs_block_device  {
      device_name = "${lookup(var.in-house-webserver-config, "block_ebs_name")}"
      volume_type = "${lookup(var.in-house-webserver-config, "block_ebs_type")}"
      volume_size = "${lookup(var.in-house-webserver-config, "block_ebs_size")}"
  }
  tags = {
      Name = "in-house-webserver-a"
  }
}

/*社内ウェブサーバインスタンス ここまで*/

/*社内データベースサーバインスタンス*/
resource "aws_instance" "in-house-dbserver-a" {
  ami = "${lookup(var.in-house-dbserver-config, "ami")}"
  instance_type = "${lookup(var.in-house-dbserver-config, "instance_type")}"
  key_name = "${lookup(var.in-house-dbserver-config, "instance_key")}"
  vpc_security_group_ids = [
      "${module.in-house-ssh-sg.security_group_id}",
      "${module.in-house-mysql-sg.security_group_id}",
  ]
  subnet_id = "${var.in-house-private-subnet-a_id}"
  associate_public_ip_address = "false"
  root_block_device  {
      volume_type = "${lookup(var.in-house-dbserver-config, "root_ebs_type")}"
      volume_size = "${lookup(var.in-house-dbserver-config, "root_ebs_size")}"
  }
  ebs_block_device  {
      device_name = "${lookup(var.in-house-dbserver-config, "block_ebs_name")}"
      volume_type = "${lookup(var.in-house-dbserver-config, "block_ebs_type")}"
      volume_size = "${lookup(var.in-house-dbserver-config, "block_ebs_size")}"
  }
  tags = {
      Name = "in-house-dbserver-a"
  }
}
/*社内データベースサーバインスタンス ここまで*/