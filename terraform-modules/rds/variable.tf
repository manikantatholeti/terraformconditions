variable "create_rds" {
  type    = bool
  # default = true
}

# variable "cluster_instances" {
#   type    = bool
#   default = true
# }


# variable "rds_db_subnet" {
#   type    = bool
#   default = true
# }

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

#################################################################
variable "name" {
  type        = string
  description = "Name of the VPC"
  # default = "mani"
}

variable "environment" {
  type        = string
  description = "Name of the env"
  default = "qa1"
}

variable "aws_region" {
  description = "The AWS region to create things in."
  default = "us-east-1"
}

variable "requestor" {
  description = "The AWS region to create things in."
  default     = "poomalairaj.r@ondotsystems.com"
}

variable "customer" {
  description = "The AWS region to create things in."
  default     = "ondot"
}

variable "tenant" {
  description = "The AWS region to create things in."
  default     = "single"
}

variable "product" {
  description = "The AWS region to create things in."
  default     = "tde"
}

variable "manager" {
  description = "The AWS region to create things in."
  default     = "rajesh.gurumurthy@fiserv.com"
}

variable "owner" {
  description = "The AWS region to create things in."
  default     = "vigneswaran.shanmugam@fiserv.com"
}

variable "purpose" {
  description = "The AWS region to create things in."
  default     = "dev"
}