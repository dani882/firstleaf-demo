variable "project_name" {
  type        = string
  description = "Name of the project"
}

variable "container_name" {
  type    = string
  default = "assesment-app"
}
variable "image_name" {
  type    = string
  default = "jrdevers/devopsassessment"
}

variable "security_groups" {
  type        = list(string)
  description = "List of VPC's security group"
}

variable "subnets" {
  type        = list(string)
  description = "List of VPC's subnets"
}

# variable "alb_target_group_arn" {
#     type = string
# }