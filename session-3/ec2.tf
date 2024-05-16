resource "aws_instance" "web" {
  ami           = "ami-0bb84b8ffd87024d8"     // data type is string, hard coded 
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.web.id ]   // dynamic

  tags = {
    Name = "terraform-session-instances"
  }
}

resource "aws_security_group" "web" {
  name        = "web"
  description = "Allow TLS inbound traffic and all outbound traffic"

  tags = {
    Name = "web"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}



// how to reference to resource?
//In order to reference to resource,we use labels (first and second)
//Syntax: first_label.second_label.attribute