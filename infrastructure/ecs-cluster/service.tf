resource "aws_ecs_service" "firstleaf-service" {
  name                               = "${var.project_name}-service"
  cluster                            = aws_ecs_cluster.firstleaf-cluster.id
  task_definition                    = aws_ecs_task_definition.firstleaf-task.arn
  desired_count                      = 1
  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200
  launch_type                        = "FARGATE"
  # load_balancer {
  #   target_group_arn = var.alb_target_group_arn
  #   container_name   = var.container_name
  #   container_port   = 80
  # }
  network_configuration {
    assign_public_ip = true
    security_groups  = var.security_groups
    subnets          = var.subnets
  }
  lifecycle {
    ignore_changes = [task_definition]
  }
}
