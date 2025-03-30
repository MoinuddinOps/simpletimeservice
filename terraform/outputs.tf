output "load_balancer_dns" {
  description = "ALB DNS Name"
  value       = aws_lb.ecs_alb.dns_name
}
