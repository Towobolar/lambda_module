resource "aws_iam_role" "lambda_role" {
  name = "lambda_iam_role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Resource": "*"
      "Sid": "Stmt1715622674076",
      "Action": [
        "ec2:RunInstances",
        "ec2:TerminateInstances"
      ],
    }
  ]
},
    ]
  })

  tags = {
    tag-key = "ec2_policy"
  }
}


# data "archive_file" "lambda" {
#   type        = "py"
#   source_file = "lambda.py"
#   output_path = "lambda.zip"
# }


# resource "aws_lambda_function" "test_lambda" {
#   # If the file is not in the current working directory you will need to include a
#   # path.module in the filename.
#   filename      = "lambda.py"
#   function_name = "terminate_ec2"
#   role          = aws_iam_role.lambda_role.arn
#   handler       = "index.test"

#   source_code_hash = data.archive_file.lambda.output_base64sha256

#   runtime = "python3.8"

#   environment {
#     variables = {
#       foo = "bar"
#     }
#   }
# }