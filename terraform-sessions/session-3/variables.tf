variable "env" {
  type = string             // Data type 
  description = "this variable is for the environment"      //Description 
  default = "dev"       //Default value
 
}

variable "ports" {
    type = list(number)
    description = "a list of port numbers"
    default = [ 22, 3306, 443, 80 ]
}