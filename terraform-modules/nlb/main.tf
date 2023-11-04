################################################################################
# Network Load Balancer
################################################################################
resource "aws_lb" "nlb_1" {
  count = var.nlb_1_arn!= "" ? 0 : 1
  name               = "${var.name}-${var.environment}-${var.product}-nlb"
  internal           = false
  load_balancer_type = "network"
  security_groups    = [aws_security_group.nlb_sg[0].id]
  # subnets            = "${var.nlb_public_subnets_ids}"
  subnet_mapping {
    subnet_id = "subnet-0c8d39f342c9ef779"
  }

  tags = {
    "Name" = "${var.name}-${var.environment}-${var.product}-nlb",
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


################################################################################
# Target Group- NLB
################################################################################
resource "aws_lb_target_group" "target_group_nlb" {
  count = var.target_group_nlb__id!= "" ? 0 : 1
  name        = "${var.name}-${var.environment}-${var.product}-nlb-tg"
  port        = 80 #443
  protocol    = "TCP"
  vpc_id      = var.vpc_id
  target_type = "alb"

  tags = {
    "Name" = "${var.name}-${var.environment}-${var.product}-nlb-tg",
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


################################################################################
# NLB Listener
################################################################################
resource "aws_lb_listener" "nlb_listener_1" {
  count = var.nlb_listener_1_id!= "" ? 0 : 1
  default_action {
    target_group_arn = "${aws_lb_target_group.target_group_nlb[0].arn}"
    type = "forward"
  }
  load_balancer_arn = "${aws_lb.nlb_1[0].arn}"
  port = 443
  protocol = "TCP"

  tags = {
    "Name" = "${var.name}-${var.environment}-${var.product}-nlb-listener",
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


################################################################################
# Security Group for NLB
################################################################################
resource "aws_security_group" "nlb_sg" {
  count = var.nlb_sg_id!= "" ? 0 : 1
  vpc_id = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.cidr_blocks}"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${var.vpc_cidr}"]
  }

  tags = {
    "Name" = "${var.name}-${var.environment}-${var.product}-nlb-sg",
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