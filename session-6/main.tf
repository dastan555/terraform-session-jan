module "ec2" {
  source  = "github.com/dastan555/terraform-session-jan//modules/ec2?ref=v1.0.0"


  env = "dev"
  ami = "ami-0bb84b8ffd87024d8"
  instance_type = "t2.micro" 
  sg = [ module.sg.security_group_id ]
}

module "sg" {
    source = "github.com/dastan555/terraform-session-jan//modules/sg?ref=v1.0.0"
    
    env = "dev"
    ports = [  "22", "80", "443" ]
}


//github.com = domain name (scm)
//dastan555 = github organization 
//terraform-session-jan = repository
//tree = 
//main = branch name (default)
//modules = directory 
//ec2 = subdirectory 