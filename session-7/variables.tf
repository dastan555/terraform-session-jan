variable "env" {
  type        = string
  description = "environment"
  default     = "dev"
}

variable "team" {
  type        = string
  description = "for team"
  default     = "devops"
}

variable "app" {
  type        = string
  description = "appliction"
  default     = "dori"
}

variable "project" {
  type        = string
  description = "project"
  default     = "nemo"
}

////////////// security group //////////////

variable "ec2_ports" {
    type = list(object({
      port = number
      protocol = string
    }
    ))
    default = [ 
    {
      port = 80
      protocol = "tcp"
    },
    {
      port = 22
      protocol = "tcp"
    } 
    ]
}


///////////////// alb security group ///////////////
variable "alb_ports" {
    type = list(object({
      port = number
      protocol = string
    }
    ))
    default = [ 
    {
      port = 80
      protocol = "tcp"
    },
    {
      port = 443
      protocol = "tcp"
    } 
    ]
}

//////////////////   launch template /////////////////////

variable "instance_type" {
  type = string
  description = "instance type"
  default = "t2.micro"  
}

variable "zone_id" {
  type = string
  description = "route53"
  default = "Z01884911BLZZGGCHTUX0"  
}