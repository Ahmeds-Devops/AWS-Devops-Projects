resource "aws_subnet" "NetflixPublicSubnet1" {
    vpc_id = aws_vpc.Netflixvpc.id
    cidr_block = var.pubcidrblock1
    availability_zone = var.pubavailaibilityzone1
    map_public_ip_on_launch = true

    tags = {
      Name = "NetflixPublicSubnet1"
    }
}

resource "aws_subnet" "NetflixPublicSubnet2" {
  vpc_id = aws_vpc.Netflixvpc.id
  cidr_block = var.pubcidrblock2
  availability_zone = var.pubavailaibilityzone2
  map_public_ip_on_launch = true

  tags = {
    Name = "NetflixPublicSubnet2"
  }
}