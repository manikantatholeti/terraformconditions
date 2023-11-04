variable "alb_1_id" {
  type        = string
  description = "alb ID of the Existing aws alb"
}

variable "alb_listener_1_id" {
  type        = string
  description = "alb_listener ID of the Existing aws alb listener"
}

variable "target_group_1_id" {
  type        = string
  description = "target group ID of the Existing aws alb"
}

variable "rule_1_id" {
  type        = string
  description = "alb_listener rule ID of the Existing aws alb listener rule"
}

variable "alb_sg_id" {
  type        = string
  description = "alb sg ID of the Existing aws alb sg"
}


variable "vpc_id" {
  type        = string
  description = "VPC ID"
}



# variable "alb_private_subnets_ids" {
#   description = "Private subnet CIDR list to create a subnet attached with NG"
# }

variable "environment" {
  description = "The AWS environment"
  default     = "dev"
}

variable "name" {
  type        = string
  description = "Name of the VPC"
  default     = "ptmaps"
}

variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "us-west-2"
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

variable "resource_name" {
  type = string
  description = "resource_name"
}

variable "container_port" {
  type        = number
  description = "port no for target group & load balancer"
  default     = "8889"
}

# variable "ssl_policy" {
#   description = "ssl_policy name for alb listener"
# }

# variable "certificate_arn" {
#   description = "certificate_arn for ssl_policy for alb listener"
# }

variable "other_cidr_blocks" {
  type        = string
  description = "CIDR Blocks for Security Group"
}

variable "vpc_cidr" {
  type = string
  description = "vpc_cidr."
}

variable "lb_listener_port" {
  type = string
  description = "Listener Port No for Load Balancer"
}

variable "lb_listener_protocol" {
  type = string
  description = "Listener Port No for Load Balancer"
}