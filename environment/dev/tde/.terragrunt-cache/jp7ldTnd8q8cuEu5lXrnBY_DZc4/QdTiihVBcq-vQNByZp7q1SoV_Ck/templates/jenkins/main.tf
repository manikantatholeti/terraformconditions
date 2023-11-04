# module "alb" {
#   source               = "../terraform-modules/alb"
#   alb_1_id             = var.alb_1_id
#   alb_listener_1_id    = var.alb_listener_1_id
#   target_group_1_id    = var.target_group_1_id
#   rule_1_id            = var.rule_1_id
#   alb_sg_id            = var.alb_sg_id
#   vpc_id               = var.vpc_id
#   resource_name        = var.resource_name
#   other_cidr_blocks    = var.other_cidr_blocks
#   vpc_cidr             = var.vpc_cidr
#   lb_listener_port     = var.lb_listener_port
#   lb_listener_protocol = var.lb_listener_protocol
#   # lb_listener_port = 80
# }


# module "nlb" {
#   source               = "../terraform-modules/nlb"
#   nlb_1_arn            = var.nlb_1_arn
#   target_group_nlb__id = var.target_group_nlb__id
#   nlb_listener_1_id    = var.nlb_listener_1_id
#   nlb_sg_id            = var.nlb_sg_id
#   cidr_blocks          = var.cidr_blocks
#   vpc_cidr             = var.vpc_cidr
#   vpc_id               = var.vpc_id
# }

module "rds" {
  source              = "../terraform-modules/rds"
  create_rds          = var.create_rds
  rds_engine          = var.rds_engine
  rds_engine_version  = var.rds_engine_version
  rds_instance_class  = var.rds_instance_class
  rds_master_username = var.rds_master_username
  rds_master_password = var.rds_master_password
  rds_instance_count  = var.rds_instance_count
  rds_database_name   = var.rds_database_name
  name                = var.name
}
