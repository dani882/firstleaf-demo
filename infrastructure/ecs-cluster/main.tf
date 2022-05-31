resource "aws_ecs_cluster" "firstleaf" {
  name = "firstleaf-cluster"
}

resource "aws_ecs_cluster_capacity_providers" "firstleaf" {
  cluster_name = aws_ecs_cluster.firstleaf.name

  capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy {
    base              = 1
    weight            = 0
    capacity_provider = "FARGATE"
  }
}