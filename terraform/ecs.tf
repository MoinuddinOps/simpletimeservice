# ECS Cluster
resource "aws_ecs_cluster" "main" {
  name = "ecs-cluster"
}

# ECS Task Definition
resource "aws_ecs_task_definition" "app" {
  family                   = "simple-time-service"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution.arn

  container_definitions = jsonencode([
    {
      name  = "simple-time-service"
      image = "moinuddink/simpletimeservice:latest"
      portMappings = [
        {
          containerPort = 5000
          hostPort      = 5000
        }
      ],
      logConfiguration = {
        logDriver = "awslogs",
        options = {
          "awslogs-group"         = aws_cloudwatch_log_group.ecs_logs.name,
          "awslogs-region"        = var.aws_region,
          "awslogs-stream-prefix" = "ecs"
        }
      }
    }
  ])
}

# ECS Service
resource "aws_ecs_service" "app" {
  name            = "simple-time-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.app.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets          = aws_subnet.private[*].id  # Run in Private Subnets
    security_groups  = [aws_security_group.ecs_tasks.id]
    assign_public_ip = false  # Private subnet tasks do not need a public IP
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.ecs_tg.arn
    container_name   = "simple-time-service"
    container_port   = 5000
  }

  depends_on = [aws_lb_listener.http]
}