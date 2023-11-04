################################################################################
# Application Load Balancer
################################################################################
resource "aws_lb" "alb_1" {
  count = var.alb_1_id!= "" ? 0 : 1
  name               = "${var.name}-${var.environment}-${var.product}-${var.resource_name}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.alb_sg[0].id}"]
  # subnets            = ["${var.alb_private_subnets_ids}"]
  subnet_mapping {
    subnet_id ="subnet-0c8d39f342c9ef779"
  }
  subnet_mapping {
    subnet_id = "subnet-028239c92dd0855b5"
  }

  tags = {
    "Name" = "${var.name}-${var.environment}-${var.product}-${var.resource_name}-alb",
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
# Target Group- ALB
################################################################################
resource "aws_lb_target_group" "target_group_1" {
  count = var.target_group_1_id!= "" ? 0 : 1
  name = "${var.name}-${var.environment}-${var.product}-${var.resource_name}-alb-tg"
  port = var.lb_listener_port
  protocol = "HTTP"
  vpc_id = "${var.vpc_id}"
  # target_type = "instance"

  lifecycle { create_before_destroy= true }

  health_check {
    path = "/health"
    healthy_threshold = 2
    unhealthy_threshold = 10
    timeout = 120
    interval = 180
    matcher = "200"
  }

  tags = {
    "Name" = "${var.name}-${var.environment}-${var.product}-${var.resource_name}-alb-tg",
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
# ALB Listener
################################################################################
resource "aws_lb_listener" "alb_listener_1" {
  count = var.alb_listener_1_id!= "" ? 0 : 1
  default_action {
    target_group_arn = "${aws_lb_target_group.target_group_1[0].arn}"
    type = "forward"
  }
  load_balancer_arn = "${aws_lb.alb_1[0].arn}"
  port = 80
  protocol = "HTTP"
  # port = var.lb_listener_port #443
  # protocol = var.lb_listener_protocol #"HTTPS"
  # ssl_policy        = var.ssl_policy
  # certificate_arn   = var.certificate_arn

  tags = {
    "Name" = "${var.name}-${var.environment}-${var.product}-${var.resource_name}-alb-listener",
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
# ALB Listener Rules
################################################################################
resource "aws_lb_listener_rule" "rule_1" {
  count = var.rule_1_id!= "" ? 0 : 1
  action {
    target_group_arn = "${aws_lb_target_group.target_group_1[0].arn}"
    type = "forward"
  }

  condition {
    path_pattern {
      values = ["/*"]
    }
  }

  listener_arn = "${aws_lb_listener.alb_listener_1[0].id}"
  priority = 100

   tags = {
    "Name" = "${var.name}-${var.environment}-${var.product}-${var.resource_name}-alb-listener-rule",
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
# Security Group for Load Balancer
################################################################################
resource "aws_security_group" "alb_sg" {
  count = var.alb_sg_id!= "" ? 0 : 1
  name = "${var.name}-${var.environment}-${var.product}-${var.resource_name}-alb-sg"
  vpc_id = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = var.container_port
    to_port     = var.container_port
    protocol    = "tcp"
    cidr_blocks = ["${var.vpc_cidr}"]
  }
  ingress {
    from_port   = var.lb_listener_port
    to_port     = var.lb_listener_port
    protocol    = "tcp"
    cidr_blocks = [var.other_cidr_blocks]
  }

  tags = {
    "Name" = "${var.name}-${var.environment}-${var.product}-${var.resource_name}-alb-sg",
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