variable "ami_id" {
    type = string
    default = "ami-0049e4b5ba14b6d36"
    description = "This is the amazon ami used"
  
}
variable "instance_type" {
    type = string
    default = "t3.small"
    description = "This is the amazon instance type used for the project"
  
}