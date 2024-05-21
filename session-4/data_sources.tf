data "aws_ami" "amazon_linux_2023" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.4.*"]
  }

//semantic versioning:
//major.minor.patch

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

data "template_file" "userdata" {
    template = file ("userdata.sh")
    vars = {
        environment = var.env 
    }
}


//data sourse block: fetch the data from pre-existing resource
//syntax: data 'first label' 'second label'