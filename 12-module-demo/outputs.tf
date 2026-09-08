output "public_ip" {
  value       = { for k, inst in aws_instance.instance_terraform : k => inst.public_ip }
  description = "This is the Public IP of instance created"
}


output "private_ip" {
  value       = { for k, inst in aws_instance.instance_terraform : k => inst.private_ip }
  description = "This is the Private IP of instance created"
}

output "instance_id" {
  value       = { for k, inst in aws_instance.instance_terraform : k => inst.id }
  description = "This is the Instance_ID of instance created"
}
