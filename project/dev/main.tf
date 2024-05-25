module "ec2" {
############################ Module Argument ##################################
    source = "../../modules/ec2"  //required argument, where you specify the location of child module 
    # version = ""   //optional argument, where you specify the version of your child module 

############## Input Variables that are required for the child module ################
env = "dev"
ami = "ami-0bb84b8ffd87024d8"
instance_type = "t2.micro" 
sg = [ module.sg.security_group_id ]
}

module "sg" {
    source = "../../modules/sg"
    
    env = "dev"
    ports = [  "22", "80", "443" ]
}

// how to reference to module?
//syntax: module.module_name.output_name
