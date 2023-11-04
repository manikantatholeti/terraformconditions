# variable "alb_1_id" {
#   type        = string
#   description = "alb ID of the Existing aws alb"
# }

# variable "alb_listener_1_id" {
#   type        = string
#   description = "alb_listener ID of the Existing aws alb listener"
# }

# variable "target_group_1_id" {
#   type        = string
#   description = "target group ID of the Existing aws alb"
# }

# variable "rule_1_id" {
#   type        = string
#   description = "alb_listener rule ID of the Existing aws alb listener rule"
# }

# variable "alb_sg_id" {
#   type        = string
#   description = "alb sg ID of the Existing aws alb sg"
# }


# variable "vpc_id" {
#   type        = string
#   description = "VPC ID"
# }

# variable "nlb_1_arn" {
#   type        = string
#   description = "nlb ID of the Existing aws nlb"
# }

# variable "target_group_nlb__id" {
#   type        = string
#   description = "target group ID of the Existing aws nlb"
# }

# variable "nlb_listener_1_id" {
#   type        = string
#   description = "nlb_listener ID of the Existing aws nlb listener"
# }

# variable "nlb_sg_id" {
#   type        = string
#   description = "nlb sg ID of the Existing aws nlb sg"
# }

# variable "cidr_blocks" {
#   type        = string
#   description = "nlb sg ID of the Existing aws nlb sg"
# }




# # variable "alb_private_subnets_ids" {
# #   description = "Private subnet CIDR list to create a subnet attached with NG"
# # }


# variable "resource_name" {
#   type        = string
#   description = "resource_name"
# }

# # variable "ssl_policy" {
# #   description = "ssl_policy name for alb listener"
# # }

# # variable "certificate_arn" {
# #   description = "certificate_arn for ssl_policy for alb listener"
# # }

# variable "other_cidr_blocks" {
#   type        = string
#   description = "CIDR Blocks for Security Group"
# }

# variable "vpc_cidr" {
#   type        = string
#   description = "vpc_cidr."
# }

# variable "lb_listener_port" {
#   type        = string
#   description = "Listener Port No for Load Balancer"
# }

# variable "lb_listener_protocol" {
#   type        = string
#   description = "Listener Port No for Load Balancer"
# }

variable "create_rds" {
  type = bool
  # default = true
}

variable "rds_engine" {
  type = string
  description = "Name of the database engine to be used for this DB cluster"
  # default = "aurora-mysql"
}

variable "rds_engine_version" {
  type = string
  description = "Database engine version"
  # default = "5.7.mysql_aurora.2.11.2"
}

# variable "availability_zones" {
#   type = string
#   description = "List of EC2 Availability Zones for the DB cluster"
#   default = ["us-east-1a", "us-east-1b"]
# }

variable "rds_instance_class" {
  type =string
  description = "Database Instance Class"
  # default = "db.t3.small"
}

# variable "db_subnet_ids" {
#   description = "Subnet IDs for RDS"
# }

variable "rds_master_username" {
  type = string
  description = "Master User Name for RDS"
  # default = "dbadmin"
}

variable "rds_master_password" {
type = string
  description = "Master Password for RDS"
  # default = "dbadmin2023"
}

variable "rds_instance_count" {
  type = string
  description = "Instance count for RDS"
  # default = "2"
}

variable "rds_database_name" {
  type = string
  description = "Name for an automatically created database on cluster creation"
  # default = "TDE-RDS-DB"
}

variable "name" {
  type        = string
  description = "Name of the VPC"
  # default = "mani"
}





