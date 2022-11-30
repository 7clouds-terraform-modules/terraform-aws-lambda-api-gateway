# 7Clouds Terraform AWS Lambda Function + API Gateway

## Usage

The module deploys a set of Lambda Function + API Gateway resources with its rightful roles and policies to create a serverless application.

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
  # SUBNET_IDS                       = ["YourSubnetsID(s)Here"]
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
}
```
