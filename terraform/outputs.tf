output "vpc_id" {
  value = module.vpc.vpc_id
}

output "ecr_repository_url" {
  value = aws_ecr_repository.app.repository_url
}

output "secrets_manager_arn" {
  value = aws_secretsmanager_secret.app_secret.arn
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "secrets_csi_role_arn" {
  value = module.secrets_csi_irsa.iam_role_arn
}

output "github_actions_role_arn" {
  value = aws_iam_role.github_actions.arn
}