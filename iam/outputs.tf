#####  Declare Outputs  #####

output "key-pair-name" {
    value = aws_key_pair.key-pair-example1.key_name
    description = ""
}

output "iam-example1-role-arn" {
    value = aws_iam_role.example1-role.arn
    description = ""
}
