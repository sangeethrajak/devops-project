module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "devops-cluster"
  cluster_version = "1.29"

  vpc_id     = aws_vpc.main.id
  subnet_ids = [
    aws_subnet.public1.id,
    aws_subnet.public2.id
  ]

  eks_managed_node_groups = {
    dev = {
      instance_types = ["t3.micro"]
      desired_size   = 1
      min_size       = 1
      max_size       = 2
    }
  }
}