resource "aws_route53_record" "expense_private_ip" {
  count = length(var.instance_names)
  allow_overwrite = true
  zone_id = var.zone_id
  name    = "${var.instance_names[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.expense[count.index].private_ip]
}

resource "aws_route53_record" "expense_public_ip" {
  count = length(var.instance_names)
  allow_overwrite = true
  zone_id = var.zone_id
  name    = var.domain_name
  type    = "A"
  ttl     = 1
  records = [aws_instance.expense[index(var.instance_names, "frontend")].public_ip]
}

