resource "aws_lambda_function" "my_lambda" {
  function_name = "simpletimeapp"
  role          = aws_iam_role.lambda_role.arn
  package_type  = "Image"
  image_uri     = "895653987498.dkr.ecr.us-east-1.amazonaws.com/simpletimeapp:latest"
  timeout       = 900
  memory_size   = 1024

  vpc_config {
    subnet_ids         = aws_subnet.private[*].id
    security_group_ids = [aws_security_group.lambda_sg.id]
  }

  environment {
    variables = {
      PORT = "5000"
    }
  }
}
