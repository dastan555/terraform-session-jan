variable "region" {
  type        = string
  description = "AWS Region"
  default     = "usw2"
}

variable "env" {
  type        = string
  description = "environment"
  default     = "dev"
}

variable "project" {
  type        = string
  description = "project name"
  default     = "jerry"
}

variable "tier" {
  type        = string
  description = "application tier"
  default     = "backend"
}

variable "team" {
  type        = string
  description = "team name"
  default     = "cloud"
}

variable "owner" {
  type        = string
  description = "owner of the resource"
  default     = "das"
}

variable "managed_by" {
  type        = string
  description = "managed by"
  default     = "terraform "

}
