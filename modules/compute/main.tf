# Módulo de Computo para el Servicio de Notificaciones
# Superficie de práctica: definir instancias EC2, ECS o recursos de computo

# Security Group para el servicio de notificaciones
resource "aws_security_group" "notifications" {
  name        = "${var.project}-${var.environment}-notifications-sg"
  description = "Security group para el servicio de notificaciones"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP desde ALB"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  ingress {
    description = "HTTPS desde ALB"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  ingress {
    description = "SSH desde red segura"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.admin_cidr]
  }

  egress {
    description = "Salida a Internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.common_tags,
    {
      Name        = "${var.project}-${var.environment}-notifications-sg"
      Environment = var.environment
      Project     = var.project
    }
  )
}

# Instancia EC2 para el servicio de notificaciones (ejemplo de compute)
resource "aws_instance" "notifications" {
  count = var.instance_count

  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.private_subnet_ids[count.index % length(var.private_subnet_ids)]

  vpc_security_group_ids = [aws_security_group.notifications.id]

  root_block_device {
    volume_size = var.root_volume_size
    volume_type = "gp3"
  }

  user_data = base64encode(templatefile("${path.module}/user_data.sh", {
    environment = var.environment
    project     = var.project
  }))

  tags = merge(
    var.common_tags,
    {
      Name        = "${var.project}-${var.environment}-notifications-${count.index + 1}"
      Environment = var.environment
      Project     = var.project
      Index       = count.index + 1
    }
  )
}

# Elastic IP para instancias si es necesario
resource "aws_eip" "notifications" {
  count = var.assign_eip ? var.instance_count : 0

  domain = "vpc"

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project}-${var.environment}-notifications-eip-${count.index + 1}"
    }
  )

  depends_on = [aws_instance.notifications]
}

# Attachment de EIP a instancia
resource "aws_eip_association" "notifications" {
  count = var.assign_eip ? var.instance_count : 0

  instance_id   = aws_instance.notifications[count.index].id
  allocation_id = aws_eip.notifications[count.index].id
}