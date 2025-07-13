
resource "aws_iam_role" "this" {
  name = "ec2_access_s3_role_v5"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy" "this" {
  name        = "ec2_s3_access_policy_v5"
  description = "Allow EC2 instance to access S3 bucket"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = [
        "s3:GetObject",
        "s3:PutObject",
        "s3:ListBucket"
      ]
      Resource = [
        var.s3_bucket_arn,
        "${var.s3_bucket_arn}/*"
      ]
    }]
  })
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}

resource "aws_iam_instance_profile" "this" {
  name = var.instance_profile_name_v5
  role = aws_iam_role.this.name
}

resource "aws_instance" "amrit_amazon_server" {
  ami = var.ami_id

  instance_type = var.instance_type
  # subnet_id                   = aws_subnet.this.id

  # vpc_security_group_ids      = [aws_security_group.amrit_sg.id]

  associate_public_ip_address = true
  key_name                    = var.key_name

  iam_instance_profile = aws_iam_instance_profile.this.name


  tags = var.tags
}