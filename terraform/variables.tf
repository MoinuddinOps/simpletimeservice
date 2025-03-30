variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "Public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "Private subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "ecs_container_image" {
  description = "Docker image"
  type        = string
  default     = "hub.docker.com/r/moinuddink/simpletimeservice"
}

variable "ecs_task_cpu" {
  description = "ECS Task CPU"
  type        = number
  default     = 256
}

variable "ecs_task_memory" {
  description = "ECS Task Memory"
  type        = number
  default     = 512
}

variable "ecs_service_name" {
  description = "ECS Service Name"
  type        = string
  default     = "my-ecs-service"
}

variable "alb_target_port" {
  description = "Application port"
  type        = number
  default     = 5000
}
