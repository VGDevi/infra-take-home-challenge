#
# Variables Configuration
#

variable "cluster-name" {
  default = "terraform-eks"
  type    = string
}

variable   "workstation-external-cidr"  {
  default = "52.95.75.13/32"
  type = string
}

data "aws_availability_zones" "available" {}