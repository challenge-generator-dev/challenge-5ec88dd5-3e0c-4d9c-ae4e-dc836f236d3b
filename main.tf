# Orquestación principal de infraestructura para el servicio de notificaciones
# Este archivo Coordina los módulos de red y computo para aprovisionar la infraestructura

# Módulo de red: VPC, subnets, gateways, rutas
module "network" {
  source = "./modules/network"
  
  environment = var.environment
  region      = var.aws_region
  
  # CIDR block para la VPC principal
  vpc_cidr = var.vpc_cidr
  
  # Tags para identificación y seguimiento
  tags = var.common_tags
}

# Módulo de computo: EC2, Auto Scaling, Load Balancer
module "compute" {
  source = "./modules/compute"
  
  environment = var.environment
  region      = var.aws_region
  
  # ID de la subnet donde se aprovisionarán las instancias
  subnet_id = module.network.private_subnet_ids[0]
  
  # Tipo de instancia para el servicio de notificaciones
  instance_type = var.instance_type
  
  # Tags para identificación y seguimiento
  tags = var.common_tags
}

# Recurso adicional: Security Group para el servicio
resource "aws_security_group" "notifications_service" {
  name        = "${var.environment}-notifications-service-sg"
  description = "Security group para el servicio de notificaciones"
  vpc_id      = module.network.vpc_id

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

  egress {
    description = "Salida a Internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.common_tags
}