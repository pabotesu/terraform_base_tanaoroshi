output "in-house-VPC_id" {
  value = "${aws_vpc.in-house-VPC.id}"
}

output "in-house-public-subnet-a_id" {
  value = "${aws_subnet.in-house-public-a.id}"
}

output "in-house-private-subnet-a_id" {
  value = "${aws_subnet.in-house-private-a.id}"
}
/*----------------------------------------------------*/

output "for-business-VPC_id" {
  value = "${aws_vpc.for-business-VPC.id}"
}

output "for-business-public-subnet-a_id" {
  value = "${aws_subnet.for-business-public-a.id}"
}

output "for-business-public-subnet-c_id" {
  value = "${aws_subnet.for-business-public-c.id}"
}

output "for-business-private-subnet-a_id" {
  value = "${aws_subnet.for-business-private-a.id}"
}

/*----------------------------------------------------*/

