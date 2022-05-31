resource "aws_ecs_service" "firstleaf-service" {
  name                = "${var.project_name}-service"
  cluster             = aws_ecs_cluster.firstleaf-cluster.id
  task_definition     = aws_ecs_task_definition.firstleaf-task.arn
  scheduling_strategy = "REPLICA"
}