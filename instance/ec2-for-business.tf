/*業務用ウェブサーバインスタンス*/
resource "aws_instance" "for-business-webserver-a" {
  ami = "${lookup(var.for-business-webserver-config, "ami")}"
  instance_type = "${lookup(var.for-business-webserver-config, "instance_type")}"
  key_name = "${lookup(var.for-business-webserver-config, "instance_key")}"
  vpc_security_group_ids = [
      "${module.for-business-http-sg.security_group_id}",
      "${module.for-business-https-sg.security_group_id}",
      "${module.for-business-ssh-sg.security_group_id}",
      "${module.for-business-mysql-sg.security_group_id}",

  ]
  subnet_id = "${var.for-business-public-subnet-a_id}"
  associate_public_ip_address = "true"
  root_block_device {
      volume_type = "${lookup(var.for-business-webserver-config, "root_ebs_type")}"
      volume_size = "${lookup(var.for-business-webserver-config, "root_ebs_size")}"
  }
  ebs_block_device {
      device_name = "${lookup(var.for-business-webserver-config, "block_ebs_name")}"
      volume_type = "${lookup(var.for-business-webserver-config, "block_ebs_type")}"
      volume_size = "${lookup(var.for-business-webserver-config, "block_ebs_size")}"
  }
  tags = {
      Name = "for-business-webserver-a"
  }
}

resource "aws_instance" "for-business-webserver-c" {
  ami = "${lookup(var.for-business-webserver-config, "ami")}"
  instance_type = "${lookup(var.for-business-webserver-config, "instance_type")}"
  key_name = "${lookup(var.for-business-webserver-config, "instance_key")}"
  vpc_security_group_ids = [
      "${module.for-business-http-sg.security_group_id}",
      "${module.for-business-https-sg.security_group_id}",
      "${module.for-business-ssh-sg.security_group_id}",
      "${module.for-business-mysql-sg.security_group_id}",
  ]
  subnet_id = "${var.for-business-public-subnet-c_id}"
  associate_public_ip_address = "true"
  root_block_device  {
      volume_type = "${lookup(var.for-business-webserver-config, "root_ebs_type")}"
      volume_size = "${lookup(var.for-business-webserver-config, "root_ebs_size")}"
  }
  ebs_block_device  {
      device_name = "${lookup(var.for-business-webserver-config, "block_ebs_name")}"
      volume_type = "${lookup(var.for-business-webserver-config, "block_ebs_type")}"
      volume_size = "${lookup(var.for-business-webserver-config, "block_ebs_size")}"
  }
  tags = {
      Name = "for-business-webserver-c"
  }
}
/*業務用ウェブサーバインスタンス ここまで*/

/*業務用データベースサーバインスタンス*/
resource "aws_instance" "for-business-dbserver-a" {
  ami = "${lookup(var.for-business-dbserver-config, "ami")}"
  instance_type = "${lookup(var.for-business-dbserver-config, "instance_type")}"
  key_name = "${lookup(var.for-business-dbserver-config, "instance_key")}"
  vpc_security_group_ids = [
      "${module.for-business-ssh-sg.security_group_id}",
      "${module.for-business-mysql-sg.security_group_id}",
  ]
  subnet_id = "${var.for-business-private-subnet-a_id}"
  associate_public_ip_address = "false"
  root_block_device  {
      volume_type = "${lookup(var.for-business-dbserver-config, "root_ebs_type")}"
      volume_size = "${lookup(var.for-business-dbserver-config, "root_ebs_size")}"
  }
  ebs_block_device  {
      device_name = "${lookup(var.for-business-dbserver-config, "block_ebs_name")}"
      volume_type = "${lookup(var.for-business-dbserver-config, "block_ebs_type")}"
      volume_size = "${lookup(var.for-business-dbserver-config, "block_ebs_size")}"
  }
  tags = {
      Name = "for-business-dbserver-a"
  }
}
/*業務用データベースサーバインスタンス ここまで*/