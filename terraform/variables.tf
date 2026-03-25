variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "project_name" {
  description = "Project name used for resource naming"
  type        = string
  default     = "eks-alpha"
}

variable "cluster_version" {
  description = "Amazon EKS Kubernetes version"
  type        = string
  default     = "1.32"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Optional list of availability zones. If null, Terraform uses the first two available AZs in the region."
  type        = list(string)
  default     = null
}

variable "app_secret_value" {
  description = "Secret value to store in AWS Secrets Manager"
  type        = string
  sensitive   = true
}

variable "domain_name" {
  description = "Public domain name served by the ingress"
  type        = string
  default     = "alexanderkachar.com"
}

variable "github_username" {
  description = "GitHub username or organization"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository name"
  type        = string
}
