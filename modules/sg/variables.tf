variable "env" {
    type = string
    description = "this is for environmrent"
    default = "dev"
}

variable "ports" {
    type = list(string)
    description = "ports"
    default = [ "22", "80", "443" ]
}