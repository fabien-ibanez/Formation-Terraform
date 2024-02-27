variable "vm-name" {
    default = "terraform-instance-fi"
    type = string
}

variable "vpc-name" {
    type = string
}

variable "env" {
    type = string
    description = "dev = development, prd = production"
}