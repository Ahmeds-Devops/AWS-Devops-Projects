resource "aws_iam_role" "NetflixInstanceRole" {
  name = "NetflixInstanceRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name = "NetflixInstanceRole"
  }
}

resource "aws_iam_role_policy_attachment" "NetflixSecretsManagerPolicyAttachment" {
  policy_arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
  role     = aws_iam_role.NetflixInstanceRole.name
}
