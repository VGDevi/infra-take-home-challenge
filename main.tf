module "app" {
  source            = "./lib/terraform-modules/app"
  namespace         = "app"
}

module "cluster" {
  source            = "./lib/terraform-modules/cluster"
}



module "lb-controller" {
  source  = "basisai/lb-controller/aws"
  version = "0.2.0"
  cluster_name = data.aws_eks_cluster.cluster.id
  cluster_oidc_issuer_url = data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer
  iam_role_name = "aws-load-balancer-controller"
  iam_role_path = "/lb/"
  # insert the 2 required variables here
}

resource "aws_iam_openid_connect_provider" "default" {
  url = data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer

  client_id_list = [
    "sts.amazonaws.com",
  ]

  thumbprint_list = [
    "9e99a48a9960b14926bb7f3b02e22da2b0ab7280",
  ]
}

# module "consent_service_postgres" {
#   source            = "./lib/terraform-modules/rds-postgres"
#   team              = "Foo"
#   identifier        = "App"
#   instance_class    = "db.t3.small"
#   allocated_storage = 20
#   username          = "foo"
#   password          = "bar"
#   subnet_ids        = module.cluster.private_subnets_ids
#   vpc_id            = module.cluster.vpc_id
#   cidr_blocks       = module.cluster.private_subnets_cidr_blocks
#   dns_zone          = module.cluster.internal_r53_zone_id
# }
