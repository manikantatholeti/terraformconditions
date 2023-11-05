resource "aws_rds_cluster" "aurora_mysql" {
  count = var.create_rds ? 1 : 0
  cluster_identifier      = "${var.name}-${var.environment}-${var.product}-active-passive-cluster"
  engine                  = var.rds_engine    #"aurora-mysql"
  engine_version          = var.rds_engine_version    # Use the desired Aurora MySQL version
  availability_zones      = ["us-east-1a", "us-east-1b"] 
  # database_name           = "${var.rds_database_name}" #"RDS-DB"
  master_username         = var.rds_master_username
  master_password         = var.rds_master_password
  db_subnet_group_name    = aws_db_subnet_group.rds_db_subnet[0].name
  skip_final_snapshot     = true
  backup_retention_period = 7

  tags = {
    "Name" = "${var.name}-${var.environment}-${var.product}-Active-Passive-Cluster",
    "environment" = "${var.environment}",
    "Region" = "${var.aws_region}",
    "Domain" = "${var.name}",
    "requestor" = "${var.requestor}",
    "customer" = "${var.customer}",
    "tenant" = "${var.tenant}",
    "product" = "${var.product}",
    "manager" = "${var.manager}",
    "owner" = "${var.owner}",
    "purpose" = "${var.purpose}"
  }
}

resource "aws_rds_cluster_instance" "cluster_instances" {
  count                = var.create_rds ?  var.rds_instance_count :0
  identifier           = "${var.name}-${var.environment}-${var.product}-rds-instance-${count.index}"
  engine               = var.rds_engine   #"aurora-mysql"
  engine_version       = var.rds_engine_version
  instance_class       = var.rds_instance_class
  availability_zone    = "us-east-1a" #[count.index]      
  db_subnet_group_name = aws_db_subnet_group.rds_db_subnet[0].name
  cluster_identifier   = aws_rds_cluster.aurora_mysql[0].id
  depends_on           = [aws_rds_cluster.aurora_mysql]

  tags = {
    "Name" = "${var.name}-${var.environment}-${var.product}-rds-instance-${count.index}",
    "environment" = "${var.environment}",
    "Region" = "${var.aws_region}",
    "Domain" = "${var.name}",
    "requestor" = "${var.requestor}",
    "customer" = "${var.customer}",
    "tenant" = "${var.tenant}",
    "product" = "${var.product}",
    "manager" = "${var.manager}",
    "owner" = "${var.owner}",
    "purpose" = "${var.purpose}"
  }
}


resource "aws_db_subnet_group" "rds_db_subnet" {
  count = var.create_rds ? 1 : 0
  name       = "${var.name}-${var.environment}-${var.product}-rds-db-subnet-group"
  subnet_ids = -var.db_subnet_ids
  tags = {
    "Name" = "${var.name}-${var.environment}-${var.product}-rds-db-subnet-group",
    "environment" = "${var.environment}",
    "Region" = "${var.aws_region}",
    "Domain" = "${var.name}",
    "requestor" = "${var.requestor}",
    "customer" = "${var.customer}",
    "tenant" = "${var.tenant}",
    "product" = "${var.product}",
    "manager" = "${var.manager}",
    "owner" = "${var.owner}",
    "purpose" = "${var.purpose}"
  }
}