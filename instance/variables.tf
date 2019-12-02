/*社内用ウェブサーバのインスタンス設定*/
variable "in-house-webserver-config" {
    type = "map"
    default = {
        ami = "ami-f80e0596"
        instance_type = "t2.micro"
        instance_key = "key_key"
        root_ebs_type = "gp2"
        root_ebs_size = "20"
        block_ebs_name = "/dev/sdx"
        block_ebs_type = "gp2"
        block_ebs_size = "100"
    }
}

/*社内用データベースサーバのインスタンス設定*/
variable "in-house-dbserver-config" {
    type = "map"
    default = {
        ami = "ami-f80e0596"
        instance_type = "t2.micro"
        instance_key = "key_key"
        root_ebs_type = "gp2"
        root_ebs_size = "20"
        block_ebs_name = "/dev/sdx"
        block_ebs_type = "gp2"
        block_ebs_size = "100"
    }
}

/*業務用ウェブサーバのインスタンス設定*/
variable "for-business-webserver-config" {
    type = "map"
    default = {
        ami = "ami-f80e0596"
        instance_type = "t2.micro"
        instance_key = "key_key"
        root_ebs_type = "gp2"
        root_ebs_size = "20"
        block_ebs_name = "/dev/sdx"
        block_ebs_type = "gp2"
        block_ebs_size = "100"
    }
}

/*業務用ウェブサーバのインスタンス設定*/
variable "for-business-dbserver-config" {
    type = "map"
    default = {
        ami = "ami-f80e0596"
        instance_type = "t2.micro"
        instance_key = "key_key"
        root_ebs_type = "gp2"
        root_ebs_size = "20"
        block_ebs_name = "/dev/sdx"
        block_ebs_type = "gp2"
        block_ebs_size = "100"
    }
}

/*ネットワークリソース*/
    variable "in-house-VPC_id" {}
    variable "in-house-public-subnet-a_id"  {}
    variable "in-house-private-subnet-a_id"  {}
    variable "for-business-VPC_id"  {}
    variable "for-business-public-subnet-a_id"  {}
    variable "for-business-public-subnet-c_id"  {}
    variable "for-business-private-subnet-a_id"  {}
