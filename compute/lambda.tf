#####  Create Lambda Function #####

resource "aws_lambda_function" "lambda-function-example1" {
    role = module.iam.iam-lambda-role-arn
    function_name = ""
    handler = ""
    runtime = ""

    ##### Lambda Function Code  #####

    filename = "filename"
}

#####  Create EventBridge for Lambda Function  #####

resource "aws_cloudwatch_event_rule" "cw_event_rule_example1" {
    name = ""
    description = ""
    schedule_expression = ""
}

##### Create Lambda Function Permissions  #####

resource "aws_lambda_permission" "lambda_permission_example1" {
    statement_id = ""
    action = ""
    function_name = aws_lambda_function.lambda-function-example1.function_name
    principal = ""
    
    source_arn = aws_cloudwatch_event_rule.cw_event_rule_example1.arn
}