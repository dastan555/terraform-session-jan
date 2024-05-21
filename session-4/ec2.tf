resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon_linux_2023.image_id  
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.web.id ]      // dynamic
  user_data = data.template_file.userdata.rendered      // get an output of the file, same as the 'cat'
    


  tags = {
    Name = "${var.env}-instance",
    Environment = var.env
  }
}

# how  to reference to resource ?
# syntax: fist lable , second label, attribude 
# example: data.aws_ami.amazon_linux_2023.image_id

//0.0.1 - 0.11.9 = ${data.template_file.userdata.rendered}, ${aws_security_group.web.id},
//0.12.0 - now = data.template_file.userdata.rentered, aws_security_gorup.web.id
