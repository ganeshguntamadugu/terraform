output "public_ip" {
  value       = module.ec2.public_ip
  description = "This is the Public IP of instance created"
}


output "private_ip" {
  value       = module.ec2.private_ip
  description = "This is the Private IP of instance created"
}

output "instance_id" {
  value       = module.ec2.instance_id
  description = "This is the Instance_ID of instance created"
}
