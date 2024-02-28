#####  Create IAM role for AWS Lambda function  #####

resource "aws_iam_role" "example1-role" {
    name = ""
    assume_role_policy    = jsonencode(
        {
            Statement = [
                {
                    Action    = "sts:AssumeRole"
                    Effect    = "Allow"
                    Principal = {
                        Service = "lambda.amazonaws.com"
                    }
                },
            ]
        }
    )   
}