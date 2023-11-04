output "rds_cluster_id" {
  value = aws_rds_cluster.aurora_mysql.*.id
}

output "rds_cluster_arn" {
  value = aws_rds_cluster.aurora_mysql.*.arn
}

output "cluster_instances_ids" {
  value = aws_rds_cluster_instance.cluster_instances.*.id
}

output "cluster_instances_arns" {
  value = aws_rds_cluster_instance.cluster_instances.*.arn
}