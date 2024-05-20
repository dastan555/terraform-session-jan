// cidr blocks

variable "public_cidr_blocks" {
  type = list(string)   // data type
  description = "this variable is for public cidr_blocks" 
  default = [ "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24" ]    

}

variable "private_cidr_blocks" {
  type = list(string)  
  description = "this variable is for private cidr_blocks" 
  default = [ "10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24" ]    

}

//AZ zones

variable "public_availability_zones" {
  type = list(string)  
  description = "this is for public AZ-s" 
  default = [ "us-east-1a", "us-east-1b", "us-east-1c" ]    

}

variable "private_availability_zones" {
  type = list(string)   
  description = "this is for private AZ-s" 
  default = [ "us-east-1a", "us-east-1b", "us-east-1c" ]    

}

// Subnets

variable "names_of_public_subnets" {
  type = list(string)   
  description = "this is for public subnet names" 
  default = [ "public_subnet1", "public_subnet2", "public_subnet3" ]
}

variable "names_of_private_subnets" {
  type = list(string)   
  description = "this is for private subnet names" 
  default = [ "private_subnet1", "private_subnet2", "private_subnet3" ]
}

