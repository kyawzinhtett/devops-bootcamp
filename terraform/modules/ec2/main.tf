data "aws_ami" "this" {
  most_recent = true
  owners      = ["self"]

  # Use the latest Packer-built application AMI for this project.
  filter {
    name   = "tag:Project"
    values = [var.project_name]
  }

  filter {
    name   = "tag:ImageRole"
    values = ["app"]
  }

  filter {
    name   = "tag:Provisioner"
    values = ["packer"]
  }
}

resource "aws_security_group" "instance_sg" {
  name        = "${var.project_name}-${var.environment}-ec2-sg"
  description = "Allow web traffic to the EC2 application instance."
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow HTTP requests from the load balancer or internet."
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS requests from the load balancer or internet."
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow outbound traffic for package updates, SSM, and application dependencies."
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-ec2-sg"
    Environment = var.environment
  }
}

resource "aws_instance" "this" {
  ami                         = data.aws_ami.this.id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_1_id
  vpc_security_group_ids      = [aws_security_group.instance_sg.id]
  associate_public_ip_address = true
  iam_instance_profile        = var.iam_instance_profile_name

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
    encrypted   = true
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-app"
    Environment = var.environment
  }
}
