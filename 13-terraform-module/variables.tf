variable "instance_something" {
  type        = map
  default     = {
    mysql = "t3.medium"
    backend = "t3.small"
    frontend = "t3.micro"
  }
}

variable ami_id_something {
  default = "ami-0220d79f3f480ecf5"
}