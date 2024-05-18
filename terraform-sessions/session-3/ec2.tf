resource "aws_instance" "web" {
  count = 3
  ami           = "ami-0bb84b8ffd87024d8"     // data type is string, hard coded 
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.web.id ]   // dynamic

  tags = {
    Name = "${var.env}-instance",
    environment = var.env
  }
}

# count = meta argument, to create identical resources
# index = 0,1,2,3,4
# indices = plural of index (indexes)


//how to reference to input variable?
//Syntax: var.variable_name 
  

//highlight + command + d = to change all in once


// how to reference to resource?
//In order to reference to resource,we use labels (first and second)
//Syntax: first_label.second_label.attribute