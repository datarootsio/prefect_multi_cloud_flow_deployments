# module "gcp" {
#   source  = "../modules/gcp"
#   project = var.gcp_project
#   region  = var.gcp_region
#   repo_id = var.gcp_repo_id
# }

# module "prefect_ecs_work_pool" {
#   source               = "../modules/prefect"
#   workpool_name        = "aws-ecs-infra"
#   workpool_type        = "ecs:push"
#   workpool_status      = var.workpool_status
#   prefect_workspace_id = var.prefect_workspace_id
#   base_job_template = templatefile("ecs-base-job-template.json", { TASK_DEFNITION_ARN = module.aws.aws_task_definition_arn,
#     CLUSTER_ARN = module.aws.aws_ecs_cluster_arn,
#     REPO_URL    = module.aws.aws_ecr_repo_url,
#     TAG         = "latest",
#     REPO_NAME   = module.aws.aws_ecr_repo_name,
#   VPC_ID = module.aws.aws_vpc_id })
#   prefect_api_key    = var.prefect_api_key
#   prefect_account_id = var.prefect_account_id
# }

# module "prefect_cloud_run_work_pool" {
#   source               = "../modules/prefect"
#   workpool_name        = "cloud-run-job-infra"
#   workpool_type        = "cloud-run:push"
#   workpool_status      = var.workpool_status
#   prefect_workspace_id = var.prefect_workspace_id
#   base_job_template = templatefile("cloud-run-base-job-template.json", { REGION = var.gcp_region,
#     PROJECT_ID = var.gcp_project,
#     REPO_ID    = var.gcp_repo_id,
#     IMAGE_NAME = "run-prefect-job",
#   TAG = "latest" })
#   prefect_api_key    = var.prefect_api_key
#   prefect_account_id = var.prefect_account_id
# }

# module "aws" {
#   source             = "../modules/aws"
#   app_name           = var.app_name
#   app_environment    = var.environment
#   public_subnet      = var.public_subnet
#   availability_zones = var.availability_zones
#   aws_region         = var.aws_region
#   aws_access_key     = var.aws_access_key
#   aws_secret_key     = var.aws_secret_key
# }

module "azurerm" {
  source              = "../modules/azure"
  name                = var.azurerm_container_registry_name
  resource_group_name = var.azurerm_resource_group_name
  location            = var.azurerm_region
  environment         = var.environment
}

module "prefect_aci_work_pool" {
  source               = "../modules/prefect"
  workpool_name        = "azure-container-instance-infra"
  workpool_type        = "azure-container-instance:push"
  workpool_status      = var.workpool_status
  prefect_workspace_id = var.prefect_workspace_id
  base_job_template = templatefile("aci-base-job-template.json", { CONTAINER_REGISTRY = var.azurerm_container_registry_name,
    SUBSCRIPTION_ID     = var.azurerm_subscription_id,
    RESOURCE_GROUP_NAME = var.azurerm_resource_group_name,
    IMAGE_NAME          = "run-prefect-job",
  TAG = "latest" })
  prefect_api_key    = var.prefect_api_key
  prefect_account_id = var.prefect_account_id
}
