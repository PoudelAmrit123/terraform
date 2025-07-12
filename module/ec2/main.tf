
resource "aws_instance" "amrit_amazon_server" {
  ami                         = var.ami_id
  
  instance_type               = var.instance_type
  # subnet_id                   = aws_subnet.this.id
  
  # vpc_security_group_ids      = [aws_security_group.amrit_sg.id]

  associate_public_ip_address = true
  key_name                    = var.key_name


  tags                        = var.tags
}