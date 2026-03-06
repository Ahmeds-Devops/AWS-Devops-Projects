resource "aws_route_table" "Netflixpublicroute" {
    vpc_id = aws_vpc.Netflixvpc.id

    route {
    cidr_block = var.routes_cidr
    gateway_id = aws_internet_gateway.Netflixigw.id
  }

    tags = {
      Name = "Netflixpublicroute"
    }
}

resource "aws_route_table_association" "Netflixroutetableassociation1" {
    route_table_id = aws_route_table.Netflixpublicroute.id
    subnet_id = aws_subnet.NetflixPublicSubnet1.id
}

resource "aws_route_table_association" "Netflixroutetableassociation" {
    route_table_id = aws_route_table.Netflixpublicroute.id
    subnet_id = aws_subnet.NetflixPublicSubnet2.id
}