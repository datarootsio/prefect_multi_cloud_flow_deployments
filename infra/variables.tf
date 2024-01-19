## GCP Variables
variable "gcp_project" {
  type        = string
  default     = "chrome-epigram-386922"
  description = "The Gcp Project Id"
}

variable "gcp_region" {
  type    = string
  default = "us-east1"
}

variable "gcp_repo_id" {
  type    = string
  default = "prefect-repository"
}

variable "gcp_base_job_template" {
  description = "Json configuration file for workpool"
  default     = "./base-job-template.json"
  type        = string
}

## Prefect Variables
variable "prefect_workspace_id" {
  description = "Workspace id of the Prefect Account"
}

variable "prefect_api_key" {
  description = "Api key that gives access to Prefect Account"
}

variable "prefect_account_id" {
  description = "Account id of your Prefect Account"
}

variable "workpool_name" {
  description = "Name given to the workpool"
  #default     = "cloud-run-job-infra"
  default = "aws-ecs-infra"
  type    = string
}

variable "workpool_type" {
  description = "The Workpool type"
  #default     = "cloud-run:push"
  default = "ecs:push"
  type    = string
}

variable "workpool_status" {
  description = "Whether the workpool is paused or not"
  type        = bool
  default     = false
}

## AWS Variables
variable "aws_base_job_template" {
  description = "Json configuration file for workpool"
  default     = "./ecs-base-job-template.json"
  type        = string
}

variable "public_subnet" {
  description = "Subnets for ECS"
  default     = "10.10.1.0/24"
}

variable "app_name" {
  description = "Name of applicatioN"
  default     = "run-prefect-job"
}

variable "availability_zones" {
  description = "Availability zone of ECS"
  default     = "us-east-1a"
}

variable "aws_region" {
  description = "Region of AWS resource"
  default     = "us-east-1"
}

variable "aws_access_key" {
  description = "Access key for IAM user"
}

variable "aws_secret_key" {
  description = "Secret key for IAM user"
}

## Azure Variables
variable "azurerm_client_id" {
  description = "Secret key ID of service principal"
}

variable "azurerm_client_secret" {
  description = "Secret key of service principal"
}

variable "azurerm_subscription_id" {
  description = "Subscription ID of azure account in which the service principal was created"
}

variable "azurerm_tenant_id" {
  description = "Tenant ID of service principal"
}

variable "azurerm_container_registry_name" {
  default = "prefectflows"
}

variable "azurerm_region" {
  default = "francecentral"
}

variable "azurerm_resource_group_name" {
  default = "test-rg"
}

## General Variables
variable "environment" {
  description = "Deployment environment"
  default     = "prod"
}
