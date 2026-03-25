resource "aws_secretsmanager_secret" "app_secret" {
  name                    = "${var.project_name}/app-secret"
  recovery_window_in_days = 0

  tags = local.common_tags
}

resource "aws_secretsmanager_secret_version" "app_secret_value" {
  secret_id     = aws_secretsmanager_secret.app_secret.id
  secret_string = var.app_secret_value
}
