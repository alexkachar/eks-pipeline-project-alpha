module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name                             = local.cluster_name
  cluster_version                          = var.cluster_version
  enable_cluster_creator_admin_permissions = true
  cluster_endpoint_public_access           = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  eks_managed_node_groups = {
    default = {
      instance_types = ["t3.medium"]
      ami_type       = "AL2023_x86_64_STANDARD"
      min_size       = 2
      max_size       = 4
      desired_size   = 2

      labels = {
        role = "general"
      }

      tags = local.common_tags
    }
  }

  tags = local.common_tags
}
