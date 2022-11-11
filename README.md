# Lambda Function + API Gateway Module by 7Clouds

Thank you for riding with us! Feel free to download or reference this respository in your terraform projects and studies

This module is a part of our product SCA — An automated API and Serverless Infrastructure generator that can reduce your API development time by 40-60% and automate your deployments up to 90%! Check it out at <https://seventechnologies.cloud>

Please rank this repo 5 starts if you like our job!

## Usage

The module deploys a set of Lambda Function + API Gateway resources with its rightful roles and policies to create a serverless application.

## Example

```hcl
module "lambda_api_gateway" {
  source                    = "../.."

# Required
  PROJECT_NAME                     = "NewModules"
  API_GATEWAY_RESOURCE_PATH        = "{proxy+}"
  API_GATEWAY_METHOD_AUTHORIZATION = "NONE"
  API_GATEWAY_METHOD_HTTP_METHOD   = "ANY"
  ENVIRONMENT                      = "DEV"  
  
# Optionals
  # AWS_REGION = "us-west-2" # The region is not required if you wish to deploy for your default region on your aws configuration file
  # TAGS       = {PlaceYourTagsMapHere}

# Structural
  COMPATIBLE_RUNTIMES               = "python3.8"
  LAMBDA_CODE_ZIP_FILE              = "YourLambdaCode.zip"
  # SECURITY_GROUP_IDS               = ["YourSecurityGroupsID(s)Here"]
  # SUBNET_IDS                       = ["YourSubnetsIDsHere"]
  # LAYER_ARN_LIST                   = ["YourLayer(s)ARNHere"]
  WARMUP_ENABLED                    = true
  LAMBDA_WARMUP_SCHEDULE_EXPRESSION = "rate(5 minutes)" # Works only with warmup_enabled = true
  MEMORY_SIZE                       = 128
  TIMEOUT                           = 60
  HANDLER                           = "app.lambda_handler"
  # ENVIRONMENT_VARIABLES            = {foo = "bar"}
  # MANAGED_POLICY_ARNS              = [
  #   "arn:aws:iam::aws:policy/SecretsManagerReadWrite",        # This need to be used if a Secrets Manager Module is attached of If application utilizes Secrets Manager
  #   "arn:aws:iam::aws:policy/AmazonCognitoPowerUser",         # This need to be used if a Cognito Module is attached of If application utilizes Cognito
  #   "arn:aws:iam::aws:policy/AmazonKinesisFirehoseFullAccess" # This need to be used if a Kinesis Firehose Module is attached of If application utilizes Kinesis Firehose
  # ]
  API_GATEWAY_INTEGRATION_HTTP_METHOD = "POST"
  API_GATEWAY_INTEGRATION_INPUT_TYPE  = "AWS_PROXY"
  # IAM_ROLE_POLICY_ATTACHMENT_ARN_LIST = ["YourIAMRolePolic(y/ies)ARNHere"]
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_api_gateway_deployment.api_gateway_deployment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_deployment) | resource |
| [aws_api_gateway_integration.api_gateway_integration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_integration) | resource |
| [aws_api_gateway_method.api_gateway_method](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_method) | resource |
| [aws_api_gateway_resource.api_gateway_resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_resource) | resource |
| [aws_api_gateway_rest_api.rest_api](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_rest_api) | resource |
| [aws_api_gateway_stage.api_gateway_stage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_stage) | resource |
| [aws_cloudwatch_event_rule.lambda_warm_up_events_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_target.lambda_warm_up_events_target](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_iam_policy_attachment.cloudwatch_deny_attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_role.lambda_iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_lambda_function.lambda_function](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [aws_lambda_permission.lambda_permission_api_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_lambda_permission.lambda_permission_warm_up](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_caller_identity.current_identity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.default_region](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_API_GATEWAY_INTEGRATION_HTTP_METHOD"></a> [API\_GATEWAY\_INTEGRATION\_HTTP\_METHOD](#input\_API\_GATEWAY\_INTEGRATION\_HTTP\_METHOD) | Integration HTTP method specifying how API Gateway will interact with the back end. Lambda function can only be invoked via POST. | `string` | `"POST"` | no |
| <a name="input_API_GATEWAY_INTEGRATION_INPUT_TYPE"></a> [API\_GATEWAY\_INTEGRATION\_INPUT\_TYPE](#input\_API\_GATEWAY\_INTEGRATION\_INPUT\_TYPE) | Integration input's type. 'AWS\_PROXY' was set for Lambda Proxy Integration | `string` | `"AWS_PROXY"` | no |
| <a name="input_API_GATEWAY_METHOD_AUTHORIZATION"></a> [API\_GATEWAY\_METHOD\_AUTHORIZATION](#input\_API\_GATEWAY\_METHOD\_AUTHORIZATION) | API Gateway Method Authorization | `string` | n/a | yes |
| <a name="input_API_GATEWAY_METHOD_HTTP_METHOD"></a> [API\_GATEWAY\_METHOD\_HTTP\_METHOD](#input\_API\_GATEWAY\_METHOD\_HTTP\_METHOD) | HTTP Method | `string` | n/a | yes |
| <a name="input_API_GATEWAY_RESOURCE_PATH"></a> [API\_GATEWAY\_RESOURCE\_PATH](#input\_API\_GATEWAY\_RESOURCE\_PATH) | API Gateway Resource Path | `string` | n/a | yes |
| <a name="input_AWS_REGION"></a> [AWS\_REGION](#input\_AWS\_REGION) | AWS Region - If set as 'null', a data will set your default region from configuration file as value | `string` | `null` | no |
| <a name="input_COMPATIBLE_RUNTIMES"></a> [COMPATIBLE\_RUNTIMES](#input\_COMPATIBLE\_RUNTIMES) | Lambda Function Compatible Runtimes | `string` | `null` | no |
| <a name="input_ENVIRONMENT"></a> [ENVIRONMENT](#input\_ENVIRONMENT) | Environment Name | `string` | n/a | yes |
| <a name="input_ENVIRONMENT_VARIABLES"></a> [ENVIRONMENT\_VARIABLES](#input\_ENVIRONMENT\_VARIABLES) | Lambda Environment Variables List | `map(any)` | `{}` | no |
| <a name="input_HANDLER"></a> [HANDLER](#input\_HANDLER) | Lambda Function Handler | `string` | `"app.lambda_handler"` | no |
| <a name="input_IAM_ROLE_POLICY_ATTACHMENT_ARN_LIST"></a> [IAM\_ROLE\_POLICY\_ATTACHMENT\_ARN\_LIST](#input\_IAM\_ROLE\_POLICY\_ATTACHMENT\_ARN\_LIST) | A list with the ARN(s) of the polic(y/ies) you want to apply | `list(string)` | `[]` | no |
| <a name="input_LAMBDA_CODE_ZIP_FILE"></a> [LAMBDA\_CODE\_ZIP\_FILE](#input\_LAMBDA\_CODE\_ZIP\_FILE) | Lambda Function Zip File | `string` | n/a | yes |
| <a name="input_LAMBDA_WARMUP_SCHEDULE_EXPRESSION"></a> [LAMBDA\_WARMUP\_SCHEDULE\_EXPRESSION](#input\_LAMBDA\_WARMUP\_SCHEDULE\_EXPRESSION) | Schedule Expression for Lambda Warm Up Events Rule | `string` | `"rate(5 minutes)"` | no |
| <a name="input_LAYER_ARN_LIST"></a> [LAYER\_ARN\_LIST](#input\_LAYER\_ARN\_LIST) | List of Layer ARNs to be attached on Lambda Function | `list(any)` | `null` | no |
| <a name="input_MANAGED_POLICY_ARNS"></a> [MANAGED\_POLICY\_ARNS](#input\_MANAGED\_POLICY\_ARNS) | Policy ARNs To Be Added to Lambda Function | `list(string)` | `null` | no |
| <a name="input_MEMORY_SIZE"></a> [MEMORY\_SIZE](#input\_MEMORY\_SIZE) | Lambda Function Memory Size | `number` | `128` | no |
| <a name="input_PROJECT_NAME"></a> [PROJECT\_NAME](#input\_PROJECT\_NAME) | The project name that will be prefixed to resource names | `string` | n/a | yes |
| <a name="input_SECURITY_GROUP_IDS"></a> [SECURITY\_GROUP\_IDS](#input\_SECURITY\_GROUP\_IDS) | Security Group ID to be referenced on Lambda Function | `list(any)` | `[]` | no |
| <a name="input_SUBNET_IDS"></a> [SUBNET\_IDS](#input\_SUBNET\_IDS) | Subnet IDs to be referenced on Lambda Function | `list(any)` | `[]` | no |
| <a name="input_TAGS"></a> [TAGS](#input\_TAGS) | Tag List | `map(string)` | `null` | no |
| <a name="input_TIMEOUT"></a> [TIMEOUT](#input\_TIMEOUT) | Timeout for lambda function | `number` | `60` | no |
| <a name="input_WARMUP_ENABLED"></a> [WARMUP\_ENABLED](#input\_WARMUP\_ENABLED) | Boolean to define whether this lambda function will have WarmUp Event triggered By CloudWatch | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_API_GATEWAY_INTEGRATION_HTTP_METHOD"></a> [API\_GATEWAY\_INTEGRATION\_HTTP\_METHOD](#output\_API\_GATEWAY\_INTEGRATION\_HTTP\_METHOD) | Integration HTTP method specifying how API Gateway will interact with the back end. Lambda function can only be invoked via POST. |
| <a name="output_API_GATEWAY_INTEGRATION_INPUT_TYPE"></a> [API\_GATEWAY\_INTEGRATION\_INPUT\_TYPE](#output\_API\_GATEWAY\_INTEGRATION\_INPUT\_TYPE) | Integration input's type. 'AWS\_PROXY' was set for Lambda Proxy Integration |
| <a name="output_API_GATEWAY_METHOD_AUTHORIZATION"></a> [API\_GATEWAY\_METHOD\_AUTHORIZATION](#output\_API\_GATEWAY\_METHOD\_AUTHORIZATION) | API Gateway Method Authorization |
| <a name="output_API_GATEWAY_METHOD_HTTP_METHOD"></a> [API\_GATEWAY\_METHOD\_HTTP\_METHOD](#output\_API\_GATEWAY\_METHOD\_HTTP\_METHOD) | HTTP Method |
| <a name="output_API_GATEWAY_RESOURCE_PATH"></a> [API\_GATEWAY\_RESOURCE\_PATH](#output\_API\_GATEWAY\_RESOURCE\_PATH) | API Gateway Resource Path |
| <a name="output_AWS_CALLER_IDENTITY_ACCOUNT_ID"></a> [AWS\_CALLER\_IDENTITY\_ACCOUNT\_ID](#output\_AWS\_CALLER\_IDENTITY\_ACCOUNT\_ID) | n/a |
| <a name="output_AWS_DEFAULT_REGION_DATA"></a> [AWS\_DEFAULT\_REGION\_DATA](#output\_AWS\_DEFAULT\_REGION\_DATA) | n/a |
| <a name="output_AWS_REGION"></a> [AWS\_REGION](#output\_AWS\_REGION) | AWS Region - If set as 'null', a data will set your default region from configuration file as value |
| <a name="output_COMPATIBLE_RUNTIMES"></a> [COMPATIBLE\_RUNTIMES](#output\_COMPATIBLE\_RUNTIMES) | Lambda Function Compatible Runtimes |
| <a name="output_ENVIRONMENT"></a> [ENVIRONMENT](#output\_ENVIRONMENT) | Environment Name |
| <a name="output_ENVIRONMENT_VARIABLES"></a> [ENVIRONMENT\_VARIABLES](#output\_ENVIRONMENT\_VARIABLES) | Lambda Environment variables List |
| <a name="output_HANDLER"></a> [HANDLER](#output\_HANDLER) | Lambda Function Handler |
| <a name="output_IAM_ROLE_POLICY_ATTACHMENT_ARN_LIST"></a> [IAM\_ROLE\_POLICY\_ATTACHMENT\_ARN\_LIST](#output\_IAM\_ROLE\_POLICY\_ATTACHMENT\_ARN\_LIST) | A list with the ARN(s) of the polic(y/ies) you want to apply |
| <a name="output_LAMBDA_CODE_ZIP_FILE"></a> [LAMBDA\_CODE\_ZIP\_FILE](#output\_LAMBDA\_CODE\_ZIP\_FILE) | Lambda Function Zip File |
| <a name="output_LAMBDA_WARMUP_SCHEDULE_EXPRESSION"></a> [LAMBDA\_WARMUP\_SCHEDULE\_EXPRESSION](#output\_LAMBDA\_WARMUP\_SCHEDULE\_EXPRESSION) | Schedule Expression for Lambda Warm Up Events Rule |
| <a name="output_LAYER_ARN_LIST"></a> [LAYER\_ARN\_LIST](#output\_LAYER\_ARN\_LIST) | List of Layer ARNs to be attached on Lambda Function |
| <a name="output_MANAGED_POLICY_ARNS"></a> [MANAGED\_POLICY\_ARNS](#output\_MANAGED\_POLICY\_ARNS) | Policy ARNs To Be Added to Lambda Function |
| <a name="output_MEMORY_SIZE"></a> [MEMORY\_SIZE](#output\_MEMORY\_SIZE) | Lambda Function Memory Size |
| <a name="output_PROJECT_NAME"></a> [PROJECT\_NAME](#output\_PROJECT\_NAME) | The project name that will be prefixed to resource names |
| <a name="output_SECURITY_GROUP_IDS"></a> [SECURITY\_GROUP\_IDS](#output\_SECURITY\_GROUP\_IDS) | Security Group ID to be referenced on Lambda Function |
| <a name="output_SUBNET_IDS"></a> [SUBNET\_IDS](#output\_SUBNET\_IDS) | Subnet IDs to be referenced on Lambda Function |
| <a name="output_TAGS"></a> [TAGS](#output\_TAGS) | Tag List |
| <a name="output_TIMEOUT"></a> [TIMEOUT](#output\_TIMEOUT) | Timeout for lambda function |
| <a name="output_WARMUP_ENABLED"></a> [WARMUP\_ENABLED](#output\_WARMUP\_ENABLED) | Boolean to define whether this lambda function will have WarmUp Event triggered By CloudWatch |
<!-- END_TF_DOCS -->