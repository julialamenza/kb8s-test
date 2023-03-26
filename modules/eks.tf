

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.30.3"

  cluster_name    = "eks-${var.cluster_name}"
  cluster_version = "1.25"
  subnet_ids      = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id

  cluster_endpoint_private_access = var.eks_public_access
  cluster_endpoint_public_access  = var.eks_private_access

  cluster_addons = {
    coredns = {
      resolve_conflicts = "OVERWRITE"
    }
    kube-proxy = {}
    vpc-cni = {
      resolve_conflicts = "OVERWRITE"
    }

  }
  eks_managed_node_group_defaults = {

    attach_cluster_primary_security_group = true
  }

  eks_managed_node_groups = {
    Nodes = {
      desired_capacity = 1
      max_capacity     = 3
      min_capacity     = 1

      instance_type = var.instance_type
    }
  }
  node_security_group_additional_rules = {
    ingress_allow_access_from_control_plane = {
      type                          = "ingress"
      protocol                      = "tcp"
      from_port                     = 9443
      to_port                       = 9443
      source_cluster_security_group = true
      description                   = "Allow access from control plane to webhook port of AWS load balancer controller"
    }


  }

}
