variable "env" {
  type = string   
  description = "this is for environment" 
  default = "dev"  //defaul value for variable 
}

variable "ports" {
  type = list(number)   
  description = "this is for the sg ports" 
  default = [ 22, 80, 443 ]
}




