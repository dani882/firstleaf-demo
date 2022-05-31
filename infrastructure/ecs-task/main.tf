resource "aws_ecs_task_definition" "firstleaf-task" {
  family                   = "firstleaf-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 1024
  memory                   = 512
  container_definitions    = <<TASK_DEFINITION
[
  {
    "name": "firstleaf-demo",
    "image": "jrdevers/devopsassessment",
    "cpu": .5,
    "memory": 256,
    "essential": true
  }
]
TASK_DEFINITION

  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }
}