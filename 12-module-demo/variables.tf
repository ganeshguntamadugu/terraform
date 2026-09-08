# Not mandatory optional, User can also override 
variable "instance" {
  type        = map(string)
  default     = {
    mysql = "t3.small"
    backend = "t3.micro"
    frontend = "t3.micro"
  }
  validation {
    condition = alltrue([
      for k in values (var.instance) :
      contains(["t3.micro", "t3.small", "t3.medium"], k)
    ])
    error_message = "The instance type must be one of these types t3.micro, t3.small, t3.medium."
  }
}

# Mandatory user should supply because, we didn't declare here
variable "ami_id" {

}

