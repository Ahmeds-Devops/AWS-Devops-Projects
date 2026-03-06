resource "aws_internet_gateway" "Netflixigw" {
    vpc_id = aws_vpc.Netflixvpc.id

    tags = {
      Name = "Netflixigw"
    }
}