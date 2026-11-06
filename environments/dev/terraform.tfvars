# Valores de variables para el entorno de desarrollo
# Servicio de Notificaciones - Configuración Dev

region              = "us-east-1"
environment         = "dev"
environment_suffix  = ""

# Red
vpc_cidr            = "10.0.0.0/16"
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.10.0/24", "10.0.20.0/24]
availability_zones  = ["us-east-1a", "us-east-1b"]

# Compute - Instancias de desarrollo
instance_type       = "t3.micro"
instance_count      = 2
ami_id              = "ami-0c55b159cbfafe1f0"

# Storage
root_volume_size    = 20
data_volume_size    = 30

# Networking
enable_public_ip     = true
enable_dns_hostnames = true
enable_vpn_gateway   = false

# Seguridad
allowed_ssh_cidr    = ["10.0.0.0/16"]
allowed_http_cidr   = ["0.0.0.0/0"]
allowed_https_cidr  = ["0.0.0.0/0"]
allowed_ssh_ports   = [22]
allowed_app_ports   = [80, 443, 8080]

# Notificaciones - Configuración específica del servicio
notification_service_enabled = true
notification_queue_name      = "notificaciones-dev-queue"
notification_topic_name      = "notificaciones-dev-topic"
alarm_email                   = "devops-dev@empresa.com"

# Tags
owner        = "equipo-devops"
project     = "servicio-notificaciones"
cost_center = "DEV-001"