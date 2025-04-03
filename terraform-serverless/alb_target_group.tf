resource "aws_lb_target_group" "lambda_tg" {
  name        = "lambda-target-group"
  target_type = "lambda"
}
