
/*--------------------以下業務用システム用インスタンスセキュリティ-----------------------*/
module "for-business-http-sg" {
  source = "./security_group_module"
  name = "for-business-http-sg"
  vpc_id = "${var.for-business-VPC_id}"
  port = "80"
  cidr_blocks = ["0.0.0.0/0"]
}

module "for-business-https-sg" {
  source = "./security_group_module"
  name = "for-business-https-sg"
  vpc_id = "${var.for-business-VPC_id}"
  port = "443"
  cidr_blocks = ["0.0.0.0/0"]
}

module "for-business-ssh-sg" {
  source = "./security_group_module"
  name = "for-business-ssh-sg"
  vpc_id = "${var.for-business-VPC_id}"
  port = "22"
  cidr_blocks = ["0.0.0.0/0"]

}

module "for-business-mysql-sg" {
  source = "./security_group_module"
  name = "for-business-mysql-sg"
  vpc_id = "${var.for-business-VPC_id}"
  port = "3306"
  cidr_blocks = ["0.0.0.0/0"]
}

/*--------------------以下社内システム用インスタンスセキュリティ-----------------------*/
module "in-house-http-sg" {
  source = "./security_group_module"
  name = "in-house-http-sg"
  vpc_id = "${var.in-house-VPC_id}"
  port = "80"
  cidr_blocks = ["0.0.0.0/0"]
}

module "in-house-https-sg" {
  source = "./security_group_module"
  name = "in-house-https-sg"
  vpc_id = "${var.in-house-VPC_id}"
  port = "443"
  cidr_blocks = ["0.0.0.0/0"]
}

module "in-house-ssh-sg" {
  source = "./security_group_module"
  name = "in-house-ssh-sg"
  vpc_id = "${var.in-house-VPC_id}"
  port = "22"
  cidr_blocks = ["0.0.0.0/0"]
}

module "in-house-mysql-sg" {
  source = "./security_group_module"
  name = "in-house-mysql-sg"
  vpc_id = "${var.in-house-VPC_id}"
  port = "3306"
  cidr_blocks = ["0.0.0.0/0"]
}
