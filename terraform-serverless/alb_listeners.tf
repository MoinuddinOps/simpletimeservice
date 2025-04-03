resource "aws_lb_listener" "http_5000" {
  load_balancer_arn = aws_lb.my_alb.arn
  port              = 5000
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.lambda_tg.arn
  }
}
