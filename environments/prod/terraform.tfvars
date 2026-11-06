# Valores de variables para el entorno de producción
# Servicio de Notificaciones - Configuración Prod

region              = "us-east-1"
environment         = "prod"
environment_suffix  = "-prd"

# Red - Producción con CIDR más restrictivo
vpc_cidr            = "10.1.0.0/16"
public_subnet_cidrs = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
private_subnet_cidrs = ["10.1.10.0/24", "10.1.20.0/24", "10.1.30.0/24"]
availability_zones  = ["us-east-1a", "us-east-1b", "us-east-1c"]

# Compute - Instancias de producción optimizadas
instance_type       = "t3.small"
instance_count      = 3
ami_id              = "ami-0c55b159cbfafe1f0"

# Storage - Mayor capacidad para producción
root_volume_size    = 30
data_volume_size    = 50

# Networking
enable_public_ip     = true
enable_dns_hostnames = true
enable_vpn_gateway   = true

# Seguridad - Producción con restricciones más estrictas
allowed_ssh_cidr    = ["10.1.0.0/16", "10.2.0.0/16"]
allowed_http_cidr   = ["10.0.0.0/8"]
allowed_https_cidr  = ["10.0.0.0/8"]
allowed_ssh_ports   = [22]
allowed_app_ports   = [80, 443]

# Notificaciones - Configuración de producción
notification_service_enabled = true
notification_queue_name      = "notificaciones-prod-queue"
notification_topic_name      = "notificaciones-prod-topic"
alarm_email                   = "devops-prod@empresa.com"

# Tags
owner        = "equipo-devops"
project     = "servicio-notificaciones"
cost_center = "PROD-001"