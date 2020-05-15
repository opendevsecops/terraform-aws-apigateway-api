output "id" {
  value = aws_api_gateway_deployment.main.id
}

output "invoke_url" {
  value = aws_api_gateway_deployment.main.invoke_url
}

output "execution_arn" {
  value = aws_api_gateway_deployment.main.execution_arn
}

