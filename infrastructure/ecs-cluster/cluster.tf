resource "aws_ecs_cluster" "firstleaf-cluster" {
  name = "${var.project_name}-cluster"
}

resource "aws_ecs_cluster_capacity_providers" "firstleaf" {
  cluster_name = aws_ecs_cluster.firstleaf-cluster.name

  capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy {
    # base              = 1
    # weight            = 100
    capacity_provider = "FARGATE"
  }
}