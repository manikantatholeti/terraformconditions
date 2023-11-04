variable "nlb_1_arn" {
  type        = string
  description = "nlb ID of the Existing aws nlb"
}

variable "target_group_nlb__id" {
  type        = string
  description = "target group ID of the Existing aws nlb"
}

variable "nlb_listener_1_id" {
  type        = string
  description = "nlb_listener ID of the Existing aws nlb listener"
}

variable "nlb_sg_id" {
  type        = string
  description = "nlb sg ID of the Existing aws nlb sg"
}

variable "cidr_blocks" {
  type        = string
  description = "nlb_listener ID of the Existing aws nlb listener"
}

variable "vpc_cidr" {
  type        = string
  description = "nlb_listener ID of the Existing aws nlb listener"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

# variable "nlb_public_subnets_ids" {
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
  default     = "us-east-1"
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

