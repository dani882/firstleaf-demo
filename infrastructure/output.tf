output "alb_target_group" {
  value = module.alb[0].target_group_arns
}

# ws_lb_target_group.main[each.value.tg_index].arn

# lookup(var.target_groups[count.index], "name", lookup(var.target_groups[count.index], "name_prefix", ""))