variable "project_name" {
  type = string
  description = "Name of the project"
}

variable "image_name" {
  type = string
  default = "jrdevers/devopsassessment"
}

variable "security_groups" {
  type = list(string)
  description = "List of VPC's security group"
}

variable "subnets" {
  type = list(string)
  description = "List of VPC's subnets"
}