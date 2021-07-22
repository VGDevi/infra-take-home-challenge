#
# Outputs
#

output "config_map_aws_auth" {
  value = module.cluster.config_map_aws_auth
}

output "kubeconfig" {
  value = module.cluster.kubeconfig
  }