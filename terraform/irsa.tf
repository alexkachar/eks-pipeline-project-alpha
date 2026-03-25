module "secrets_csi_irsa" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "~> 5.0"

  role_name = "${var.project_name}-secrets-csi"

  attach_external_secrets_policy = false

  oidc_providers = {
    main = {
      provider_arn               = module.eks.oidc_provider_arn
      namespace_service_accounts = ["kube-system:secrets-provider-aws"]
    }
  }

  role_policy_arns = {
    secrets = aws_iam_policy.secrets_csi.arn
  }

  tags = local.common_tags
}

resource "aws_iam_policy" "secrets_csi" {
  name        = "${var.project_name}-secrets-csi"
  description = "Allow Secrets Store CSI Driver AWS provider to read from Secrets Manager"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret"
        ]
        Resource = [aws_secretsmanager_secret.app_secret.arn]
      }
    ]
  })
}
