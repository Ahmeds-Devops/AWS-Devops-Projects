resource "aws_vpc" "Netflixvpc" {
    cidr_block = var.cidr_block

    tags = {
      Name = "Netflixvpc"
    }
}