output "lambda_invoke_arn" {
    value = aws_lambda_function.order_ride_lambda.invoke_arn
}