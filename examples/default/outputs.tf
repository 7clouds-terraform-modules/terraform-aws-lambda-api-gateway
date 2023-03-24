output "AWS_CALLER_IDENTITY_ACCOUNT_ID" {
  value = module.lambda_api_gateway.AWS_CALLER_IDENTITY_ACCOUNT_ID
}

output "AWS_DEFAULT_REGION_DATA" {
  value = module.lambda_api_gateway.AWS_DEFAULT_REGION_DATA
}

output "PROJECT_NAME" {
  description = "The project name that will be prefixed to resource names"
  value       = module.lambda_api_gateway.PROJECT_NAME
}

output "API_GATEWAY_RESOURCE_PATH" {
  description = "API Gateway Resource Path"
  value       = module.lambda_api_gateway.API_GATEWAY_RESOURCE_PATH
}

output "API_GATEWAY_METHOD_AUTHORIZATION" {
  description = "API Gateway Method Authorization"
  value       = module.lambda_api_gateway.API_GATEWAY_METHOD_AUTHORIZATION

}

output "API_GATEWAY_METHOD_HTTP_METHOD" {
  description = "HTTP Method"
  value       = module.lambda_api_gateway.API_GATEWAY_METHOD_HTTP_METHOD
}

output "ENVIRONMENT" {
  description = "Environment Name"
  value       = module.lambda_api_gateway.ENVIRONMENT
}

output "AWS_REGION" {
  description = "AWS Region - If set as 'null', a data will set your default region from configuration file as value"
  value       = module.lambda_api_gateway.AWS_REGION
}

output "TAGS" {
  description = "Tag List"
  value       = module.lambda_api_gateway.TAGS
}

output "API_GATEWAY_INTEGRATION_INPUT_TYPE" {
  description = "Integration input's type. 'AWS_PROXY' was set for Lambda Proxy Integration"
  value       = module.lambda_api_gateway.API_GATEWAY_INTEGRATION_INPUT_TYPE
}

output "API_GATEWAY_INTEGRATION_HTTP_METHOD" {
  description = "Integration HTTP method specifying how API Gateway will interact with the back end. Lambda function can only be invoked via POST."
  value       = module.lambda_api_gateway.API_GATEWAY_INTEGRATION_HTTP_METHOD
}

output "MANAGED_POLICY_ARNS" {
  description = "Policy ARNs to be added to Lambda Function"
  value       = module.lambda_api_gateway.MANAGED_POLICY_ARNS
}

output "COMPATIBLE_RUNTIMES" {
  description = "Lambda Function Compatible Runtimes"
  value       = module.lambda_api_gateway.COMPATIBLE_RUNTIMES
}

output "MEMORY_SIZE" {
  description = "Lambda Function Memory Size"
  value       = module.lambda_api_gateway.MEMORY_SIZE
}

output "TIMEOUT" {
  description = "Timeout for lambda function"
  value       = module.lambda_api_gateway.TIMEOUT
}

output "HANDLER" {
  description = "Lambda Function Handler"
  value       = module.lambda_api_gateway.HANDLER
}

output "LAMBDA_CODE_ZIP_FILE" {
  description = "Lambda Function Zip File"
  value       = module.lambda_api_gateway.LAMBDA_CODE_ZIP_FILE
}

output "LAYER_ARN_LIST" {
  description = "List of Layer ARNs to be attached on Lambda Function"
  value       = module.lambda_api_gateway.LAYER_ARN_LIST
}

output "ENVIRONMENT_VARIABLES" {
  description = "Lambda Environment variables List"
  value       = module.lambda_api_gateway.ENVIRONMENT_VARIABLES
}

output "SECURITY_GROUP_IDS" {
  description = "Security Group ID to be referenced on Lambda Function"
  value       = module.lambda_api_gateway.SECURITY_GROUP_IDS
}

output "SUBNET_IDS" {
  description = "Subnet IDs to be referenced on Lambda Function"
  value       = module.lambda_api_gateway.SUBNET_IDS
}

output "WARMUP_ENABLED" {
  description = "Boolean to define whether this lambda function will have WarmUp Event triggered By CloudWatch "
  value       = module.lambda_api_gateway.WARMUP_ENABLED
}

output "LAMBDA_WARMUP_SCHEDULE_EXPRESSION" {
  description = "Schedule Expression for Lambda Warm Up Events Rule"
  value       = module.lambda_api_gateway.LAMBDA_WARMUP_SCHEDULE_EXPRESSION
}

output "CLOUDWATCH_LAMBDA_WARMUP_EVENTS_RULE_ARN" {
  description = "Schedule Expression for Lambda Warm Up Events Rule"
  value       = module.lambda_api_gateway.CLOUDWATCH_LAMBDA_WARMUP_EVENTS_RULE_ARN
}