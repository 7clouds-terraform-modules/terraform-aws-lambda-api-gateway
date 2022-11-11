module "lambda_api_gateway" {
  source = "../.."

  # Required
  PROJECT_NAME                     = "NewModules"
  API_GATEWAY_RESOURCE_PATH        = "{proxy+}"
  API_GATEWAY_METHOD_AUTHORIZATION = "NONE"
  API_GATEWAY_METHOD_HTTP_METHOD   = "ANY"
  ENVIRONMENT                      = "DEV"

  # Optionals
  AWS_REGION = "us-west-2"
  TAGS = { Enviromnet = "Example"
    Terraform = true
  }

  # Structural
  COMPATIBLE_RUNTIMES                 = "python3.8"
  LAMBDA_CODE_ZIP_FILE                = "YourLambdaCode.zip"
  SECURITY_GROUP_IDS                  = ["YourSecurityGroupsID(s)Here"]
  SUBNET_IDS                          = ["YourSubnetsIDsHere"]
  LAYER_ARN_LIST                      = ["YourLayer(s)ARNHere"]
  WARMUP_ENABLED                      = true
  LAMBDA_WARMUP_SCHEDULE_EXPRESSION   = "rate(5 minutes)"
  MEMORY_SIZE                         = 128
  TIMEOUT                             = 60
  HANDLER                             = "app.lambda_handler"
  ENVIRONMENT_VARIABLES               = { foo = "bar" }
  MANAGED_POLICY_ARNS                 = ["YourManagedPolic(y/ies)Here"]
  API_GATEWAY_INTEGRATION_HTTP_METHOD = "POST"
  API_GATEWAY_INTEGRATION_INPUT_TYPE  = "AWS_PROXY"
  IAM_ROLE_POLICY_ATTACHMENT_ARN_LIST = ["YourIAMRolePolic(y/ies)ARNHere"]
}