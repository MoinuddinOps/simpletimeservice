resource "aws_cloudwatch_log_group" "ecs_logs" {
  name              = "/ecs/simple-time-service"
  retention_in_days = 7

  tags = { Name = "ecs-log-group" }
}