output "AWS_CALLER_IDENTITY_ACCOUNT_ID" {
  value = data.aws_caller_identity.current_identity.account_id
}

output "AWS_DEFAULT_REGION_DATA" {
  value = data.aws_region.default_region.name
}

output "PROJECT_NAME" {
  description = "The project name that will be prefixed to resource names"
  value       = var.PROJECT_NAME
}

output "API_GATEWAY_RESOURCE_PATH" {
  description = "API Gateway Resource Path"
  value       = var.API_GATEWAY_RESOURCE_PATH
}

output "API_GATEWAY_METHOD_AUTHORIZATION" {
  description = "API Gateway Method Authorization"
  value       =  var.API_GATEWAY_METHOD_AUTHORIZATION

}

output "API_GATEWAY_METHOD_HTTP_METHOD" {
  description = "HTTP Method"
  value       =  var.API_GATEWAY_METHOD_HTTP_METHOD
}

output "ENVIRONMENT" {
  description = "Environment Name"
  value       = var.ENVIRONMENT
}

output "AWS_REGION" {
  description = "AWS Region - If set as 'null', a data will set your default region from configuration file as value"
  value       = var.AWS_REGION
}

output "TAGS" {
  description = "Tag List"
  value       = var.TAGS
}

output "API_GATEWAY_INTEGRATION_INPUT_TYPE" {
  description = "Integration input's type. 'AWS_PROXY' was set for Lambda Proxy Integration"
  value       = var.API_GATEWAY_INTEGRATION_INPUT_TYPE
}

output "API_GATEWAY_INTEGRATION_HTTP_METHOD" {
  description = "Integration HTTP method specifying how API Gateway will interact with the back end. Lambda function can only be invoked via POST."
  value       = var.API_GATEWAY_INTEGRATION_HTTP_METHOD
}

output "MANAGED_POLICY_ARNS" {
  description = "Policy ARNs To Be Added to Lambda Function"
  value       = var.MANAGED_POLICY_ARNS
}

output "IAM_ROLE_POLICY_ATTACHMENT_ARN_LIST" {
  description = "A list with the ARN(s) of the polic(y/ies) you want to apply"
  value       = var.IAM_ROLE_POLICY_ATTACHMENT_ARN_LIST
}

output "COMPATIBLE_RUNTIMES" {
  description = "Lambda Function Compatible Runtimes"
  value       = var.COMPATIBLE_RUNTIMES
}

output "MEMORY_SIZE" {
  description = "Lambda Function Memory Size"
  value       = var.MEMORY_SIZE
}

output "TIMEOUT" {
  description = "Timeout for lambda function "
  value       = var.TIMEOUT
}

output "HANDLER" {
  description = "Lambda Function Handler"
  value       = var.HANDLER
}

output "LAMBDA_CODE_ZIP_FILE" {
  description = "Lambda Function Zip File"
  value       = var.LAMBDA_CODE_ZIP_FILE
}

output "LAYER_ARN_LIST" {
  description = "List of Layer ARNs to be attached on Lambda Function"
  value       = var.LAYER_ARN_LIST
}

output "ENVIRONMENT_VARIABLES" {
  description = "Lambda Environment variables List"
  value       = var.ENVIRONMENT_VARIABLES
}

output "SECURITY_GROUP_IDS" {
  description = "Security Group ID to be referenced on Lambda Function"
  value       = var.SECURITY_GROUP_IDS
}

output "SUBNET_IDS" {
  description = "Subnet IDs to be referenced on Lambda Function"
  value       = var.SUBNET_IDS
}

output "WARMUP_ENABLED" {
  description = "Boolean to define whether this lambda function will have WarmUp Event triggered By CloudWatch "
  value       = var.WARMUP_ENABLED
}

output "LAMBDA_WARMUP_SCHEDULE_EXPRESSION" {
  description = "Schedule Expression for Lambda Warm Up Events Rule"
  value       = var.LAMBDA_WARMUP_SCHEDULE_EXPRESSION
}