output "name" {
  value = var.name
}

output "description" {
  value = var.description
}

output "id" {
  value = aws_api_gateway_rest_api.main.id
}

output "arn" {
  value = aws_api_gateway_rest_api.main.arn
}

output "root_resource_id" {
  value = aws_api_gateway_rest_api.main.root_resource_id
}

output "created_date" {
  value = aws_api_gateway_rest_api.main.created_date
}

output "execution_arn" {
  value = aws_api_gateway_rest_api.main.execution_arn
}

