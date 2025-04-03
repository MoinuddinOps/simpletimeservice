resource "aws_lb_target_group" "lambda_tg" {
  name        = "lambda-target-group"
  target_type = "lambda"

  health_check {
    enabled             = true
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = "200-299"
  }
}
