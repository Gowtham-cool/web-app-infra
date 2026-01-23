output "alb_dns" {
  value = aws_lb.web_alb.dns_name
}

output "ec2_id" {
  value = aws_instance.web.id
}
