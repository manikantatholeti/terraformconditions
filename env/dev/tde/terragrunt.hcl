
################################################################################
# Source Path
################################################################################

terraform {
  #source = "git@github.com:manikantatholeti/terraformconditions.git//templates/jenkins"
  source = "../../..//terraform-templates/jenkins"
}
################################################################################
# Dependancy Path (If Any)
################################################################################


################################################################################
# Inputs
################################################################################
inputs = {
create_rds = "false"
rds_engine = "aurora-mysql"
rds_engine_version = "5.7.mysql_aurora.2.11.2"
rds_instance_class = "db.t3.small"
rds_master_username ="dbadmin"
rds_master_password = "dbadmin2023"
rds_instance_count = "2"
subnet_ids = ["subnet-0c8d39f342c9ef779", "subnet-028239c92dd0855b5"]
rds_database_name = "TDE-RDS-DB"
name = "mani"
}

