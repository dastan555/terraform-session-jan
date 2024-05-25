resource "aws_instance" "web" {
  ami           = var.ami     // data type is string, hard coded 
  instance_type = var.instance_type
  vpc_security_group_ids = var.sg

  tags = { 
    Name = "${var.env}-instance"
    environment = var.env
  }
}

