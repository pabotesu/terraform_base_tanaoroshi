provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "${var.region}"
}

module "network" {
  source = "./network"
  
}

module "instance" {
  /*ネットワークのid等をここで取得*/
  in-house-VPC_id = "${module.network.in-house-VPC_id}"
  in-house-public-subnet-a_id = "${module.network.in-house-public-subnet-a_id}"
  in-house-private-subnet-a_id = "${module.network.in-house-private-subnet-a_id}"
  for-business-VPC_id = "${module.network.for-business-VPC_id}"
  for-business-public-subnet-a_id = "${module.network.for-business-public-subnet-a_id}"
  for-business-public-subnet-c_id = "${module.network.for-business-public-subnet-c_id}"
  for-business-private-subnet-a_id = "${module.network.for-business-private-subnet-a_id}"
  /*ここまで*/

  source = "./instance"
  
}

