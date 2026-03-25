locals {
  cluster_name = "${var.project_name}-cluster"
  azs          = var.availability_zones != null ? var.availability_zones : slice(data.aws_availability_zones.available.names, 0, 2)

  common_tags = {
    Project   = var.project_name
    ManagedBy = "terraform"
  }
}
