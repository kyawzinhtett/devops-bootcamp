resource "aws_security_group" "db_sg" {
  name        = "${var.project_name}-${var.environment}-db-sg"
  description = "Allow MySQL traffic from the application server only."
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow MySQL connections from the EC2 application security group."
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [var.app_security_group_id]
  }

  egress {
    description = "Allow outbound traffic for managed RDS operations."
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-db-sg"
    Environment = var.environment
  }
}

resource "aws_db_parameter_group" "mysql" {
  name   = "${var.project_name}-${var.environment}-mysql-parameter-group"
  family = "mysql8.4"

  parameter {
    name  = "character_set_server"
    value = "utf8"
  }

  parameter {
    name  = "character_set_client"
    value = "utf8"
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-mysql-parameter-group"
    Environment = var.environment
  }
}

resource "aws_db_subnet_group" "private" {
  name       = "${var.project_name}-${var.environment}-private-db-subnets"
  subnet_ids = [var.private_subnet_1_id, var.private_subnet_2_id]

  tags = {
    Name        = "${var.project_name}-${var.environment}-private-db-subnets"
    Environment = var.environment
  }
}

resource "aws_db_instance" "app_db" {
  allocated_storage           = 30
  db_name                     = var.db_name
  engine                      = var.db_engine
  engine_version              = var.db_engine_version
  instance_class              = var.db_instance_class
  username                    = var.db_user
  manage_master_user_password = var.db_manage_master_user_password
  parameter_group_name        = aws_db_parameter_group.mysql.name
  skip_final_snapshot         = true
  db_subnet_group_name        = aws_db_subnet_group.private.name
  vpc_security_group_ids      = [aws_security_group.db_sg.id]
  publicly_accessible         = false

  tags = {
    Name        = "${var.project_name}-${var.environment}-db"
    Environment = var.environment
  }
}
