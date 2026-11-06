# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener el proyecto completo y arrancable. Guarda los archivos que te devuelva en la
carpeta del repo, respetando exactamente las rutas.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Superficie de practica — NO resuelvas

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs.

- `main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/network/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/network/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/network/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/compute/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/compute/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/compute/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.

## Herramientas

- **Terraform**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).

## Como saber que terminaste

```bash
docker build -t reto:local . && terraform -chdir=terraform init -backend=false && terraform -chdir=terraform validate
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Perfil
Chapter DevOps, Especialidad Ingenieria, Tecnología Terraform, Advanced L2

### Brecha de conocimiento
Aprovisionar infraestructura con Terraform (corrida e2e 20261106172943501), Aprovisiona con Terraform la red y el computo del servicio de notificaciones

### Misión / candidato
Versionar la infraestructura del servicio de notificaciones

### Reto
- Tema: Infraestructura como codigo con Terraform
- Seniority: advanced-l2
- Tipo: practical
- Título: Aprovisionamiento de Infraestructura para el Servicio de Notificaciones
- Tiempo estimado: 8 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Exploración y Configuración Inicial — objetivo: Configurar el entorno de Terraform para el aprovisionamiento de la infraestructura. — entregable (NO resolver): Archivo de configuración de Terraform inicial con los componentes básicos de red y computo.
- Fase 2: Aprovisionamiento de la Red — objetivo: Aprovisionar la red necesaria para el servicio de notificaciones utilizando Terraform. — entregable (NO resolver): Red aprovisionada y verificada para el servicio de notificaciones.
- Fase 3: Aprovisionamiento del Computo — objetivo: Aprovisionar el computo necesario para el servicio de notificaciones utilizando Terraform. — entregable (NO resolver): Computo aprovisionado y verificado para el servicio de notificaciones.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (entrega de archivos).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Entrega de archivos
Entregá cada archivo con su ruta completa, respetando exactamente la estructura de rutas
indicada por los marcadores: un bloque por archivo, precedido por su ruta. No generes ZIPs
ni archivos adjuntos.
La entrega debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: Entregá los archivos completos al finalizar. No preguntes si el usuario
quiere recibirlos. Simplemente entregalos; No debes desplegar en el chat el resumen de lo que arreglaste, solo entregá los archivos.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del último archivo entregado
No preguntes si el usuario quiere los archivos: simplemente entregalos siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: providers.tf ===
# Configuración del proveedor AWS y versión de Terraform requerida
# Este archivo define el proveedor AWS y establece la versión mínima de Terraform
# para asegurar compatibilidad con las características utilizadas.

terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configuración del proveedor AWS
provider "aws" {
  region = var.aws_region
  
  # Tags por defecto para todos los recursos creados
  default_tags {
    tags = {
      Environment     = var.environment
      Project         = "notifications-service"
      Terraform       = "true"
      ManagedBy       = "Terraform"
    }
  }
}

# Variables requeridas por el proveedor AWS
variable "aws_region" {
  description = "La región de AWS donde se aprovisionará la infraestructura"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "El entorno para el que se aprovisiona la infraestructura (dev, prod, etc.)"
  type        = string
  default     = "dev"
}

// === ARCHIVO: variables.tf ===
# Declaración de variables globales para personalización por entorno
# Estas variables serán utilizadas en los módulos de red y computo
# y pueden ser sobrescritas mediante archivos tfvars.

variable "vpc_cidr_block" {
  description = "El bloque CIDR para la VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Lista de bloques CIDR para las subredes públicas"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Lista de bloques CIDR para las subredes privadas"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "instance_type" {
  description = "El tipo de instancia EC2 para el servicio de notificaciones"
  type        = string
  default     = "t3.micro"
}

variable "min_size" {
  description = "Número mínimo de instancias en el Auto Scaling Group"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Número máximo de instancias en el Auto Scaling Group"
  type        = number
  default     = 3
}

variable "desired_capacity" {
  description = "Capacidad deseada de instancias en el Auto Scaling Group"
  type        = number
  default     = 2
}

variable "ami_id" {
  description = "ID de la AMI para las instancias EC2"
  type        = string
  default     = "ami-0c55b159cbfafe1f0" # Amazon Linux 2
}

// === ARCHIVO: modules/network/variables.tf ===
# Variables específicas para el módulo de red
# Estas variables permiten personalizar la configuración de la red
# para diferentes entornos.

variable "vpc_cidr" {
  description = "El bloque CIDR para la VPC"
  type        = string
}

variable "public_subnets" {
  description = "Lista de bloques CIDR para las subredes públicas"
  type        = list(string)
}

variable "private_subnets" {
  description = "Lista de bloques CIDR para las subredes privadas"
  type        = list(string)
}

variable "availability_zones" {
  description = "Lista de zonas de disponibilidad donde se desplegarán las subredes"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "enable_nat_gateway" {
  description = "Indica si se debe crear un NAT Gateway para las subredes privadas"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Indica si se debe usar un solo NAT Gateway para todas las subredes privadas"
  type        = bool
  default     = true
}

// === ARCHIVO: modules/compute/variables.tf ===
# Variables específicas para el módulo de computo
# Estas variables permiten personalizar la configuración del computo
# para diferentes entornos.

variable "instance_type" {
  description = "El tipo de instancia EC2 para el servicio de notificaciones"
  type        = string
}

variable "min_size" {
  description = "Número mínimo de instancias en el Auto Scaling Group"
  type        = number
}

variable "max_size" {
  description = "Número máximo de instancias en el Auto Scaling Group"
  type        = number
}

variable "desired_capacity" {
  description = "Capacidad deseada de instancias en el Auto Scaling Group"
  type        = number
}

variable "ami_id" {
  description = "ID de la AMI para las instancias EC2"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "Lista de IDs de security groups para las instancias"
  type        = list(string)
}

variable "subnet_ids" {
  description = "Lista de IDs de subredes donde se desplegarán las instancias"
  type        = list(string)
}

variable "key_name" {
  description = "Nombre de la clave SSH para acceder a las instancias"
  type        = string
  default     = "notifications-service-key"
}

variable "user_data" {
  description = "Script de user data para configurar las instancias al iniciarse"
  type        = string
  default     = ""
}

variable "enable_monitoring" {
  description = "Indica si se debe habilitar el monitoreo detallado para las instancias"
  type        = bool
  default     = true
}

// === ARCHIVO: main.tf ===
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

// === ARCHIVO: outputs.tf ===
# Salidas de valores clave para consumo externo y verificación
# Expone los IDs y endpoints críticos aprovisionados

output "vpc_id" {
  description = "ID de la VPC principal aprovisionada"
  value       = module.network.vpc_id
}

output "vpc_cidr" {
  description = "CIDR block de la VPC principal"
  value       = module.network.vpc_cidr
}

output "public_subnet_ids" {
  description = "IDs de las subnets públicas"
  value       = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs de las subnets privadas"
  value       = module.network.private_subnet_ids
}

output "instance_ids" {
  description = "IDs de las instancias EC2 aprovisionadas"
  value       = module.compute.instance_ids
}

output "instance_public_ips" {
  description = "IPs públicas de las instancias EC2"
  value       = module.compute.instance_public_ips
}

output "load_balancer_dns" {
  description = "DNS del Application Load Balancer"
  value       = module.compute.alb_dns_name
}

output "load_balancer_arn" {
  description = "ARN del Application Load Balancer"
  value       = module.compute.alb_arn
}

output "security_group_id" {
  description = "ID del Security Group del servicio de notificaciones"
  value       = aws_security_group.notifications_service.id
}

output "environment" {
  description = "Entorno desplegado"
  value       = var.environment
}

// === ARCHIVO: README.md ===
# Infraestructura como Código - Servicio de Notificaciones

Este proyecto contiene la definición de infraestructura en Terraform para el servicio de notificaciones, aprovisionando los componentes de red y computo necesarios en AWS.

## Descripción del Proyecto

El servicio de notificaciones es crítico para la comunicación entre usuarios y debe ser desplegado en una infraestructura reproducible y versionada. Este código aprovisiona:

- **Red**: VPC, subnets públicas y privadas, Internet Gateway, NAT Gateway, tablas de rutas
- **Computo**: Instancias EC2, Auto Scaling Group, Application Load Balancer
- **Seguridad**: Security Groups con reglas apropiadas para el servicio

## Prerrequisitos

- Terraform >= 1.5 instalado
- Credenciales de AWS configuradas (AWS CLI con perfil adecuado o variables de entorno)
- Acceso a la región AWS objetivo

## Estructura del Proyecto

```
.
├── main.tf                 # Orquestación de módulos principales
├── outputs.tf              # Salidas de valores clave
├── providers.tf            # Configuración del provider AWS
├── variables.tf            # Definición de variables
├── modules/
│   ├── network/           # Módulo de aprovisionamiento de red
│   └── compute/           # Módulo de aprovisionamiento de cómputo
├── environments/
│   ├── dev/               # Variables para entorno de desarrollo
│   └── prod/              # Variables para entorno de producción
└── scripts/
    └── healthcheck.sh     # Script de verificación de salud
```

## Uso

### Inicializar Terraform

```bash
terraform init
```

Este comando descarga los providers necesarios y inicializa el backend.

### Seleccionar Entorno

Los archivos de variables por entorno se encuentran en `environments/`:

- **Desarrollo**: `environments/dev/terraform.tfvars`
- **Producción**: `environments/prod/terraform.tfvars`

Para aplicar un entorno específico, usa la bandera `-var-file`:

```bash
# Para desarrollo
terraform plan -var-file=environments/dev/terraform.tfvars

# Para producción
terraform plan -var-file=environments/prod/terraform.tfvars
```

### Validar Configuración

```bash
terraform validate
```

Verifica que la configuración de Terraform sea sintácticamente válida.

### Planificar Cambios

```bash
terraform plan -var-file=environments/dev/terraform.tfvars -out=tfplan
```

Genera un plan de ejecución que muestra los recursos que se crearán, modificarán o eliminarán.

### Aplicar Cambios

```bash
terraform apply tfplan
```

Aplica los cambios planificados. Confirma cuando se solicite.

### Destruir Infraestructura

```bash
terraform destroy -var-file=environments/dev/terraform.tfvars
```

**Advertencia**: Esta acción elimina todos los recursos aprovisionados. Usar con precaución.

## Variables Principales

| Variable | Descripción | Valor por defecto |
|----------|-------------|-------------------|
| `environment` | Entorno de despliegue (dev, prod) | "dev" |
| `aws_region` | Región AWS | "us-east-1" |
| `vpc_cidr` | CIDR block para la VPC | "10.0.0.0/16" |
| `instance_type` | Tipo de instancia EC2 | "t3.medium" |

## Outputs Disponibles

Después de aplicar la configuración, Terraform expone los siguientes valores:

- `vpc_id`: ID de la VPC principal
- `vpc_cidr`: CIDR de la VPC
- `public_subnet_ids`: IDs de subnets públicas
- `private_subnet_ids`: IDs de subnets privadas
- `instance_ids`: IDs de instancias EC2
- `instance_public_ips`: IPs públicas de instancias
- `load_balancer_dns`: DNS del ALB
- `security_group_id`: ID del Security Group

## Verificación post-despliegue

Ejecutar el script de healthcheck después del despliegue:

```bash
./scripts/healthcheck.sh
```

## Consideraciones de Seguridad

- Las credenciales de AWS nunca deben estar en el código
- Usar IAM roles con permisos mínimos necesarios
- Habilitar encryption en EBS y RDS si se usa
- Revisar regularmente los Security Groups
- Los secretos deben gestionarse via AWS Secrets Manager o Parameter Store

## Mantenimiento

Para actualizar la infraestructura:

1. Modificar los archivos `.tf` correspondientes
2. Ejecutar `terraform plan` para ver cambios
3. Revisar el plan cuidadosamente
4. Aplicar con `terraform apply`

Para actualizar Terraform:

```bash
terraform init -upgrade
```

## Licencia

Uso interno - Equipo de DevOps


// === ARCHIVO: modules/network/main.tf ===
# Módulo de Red para el Servicio de Notificaciones
# Superficie de práctica: definir recursos de red VPC, subredes y gateways

# VPC principal del servicio de notificaciones
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge(
    var.common_tags,
    {
      Name        = "${var.project}-${var.environment}-vpc"
      Environment = var.environment
      Project     = var.project
    }
  )
}

# Subred pública para ALB/NAT Gateway
resource "aws_subnet" "public" {
  count = length(var.availability_zones)

  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, count.index)
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project}-${var.environment}-public-subnet-${count.index + 1}"
      Type = "public"
    }
  )
}

# Subred privada para servicios de aplicación
resource "aws_subnet" "private" {
  count = length(var.availability_zones)

  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, count.index + length(var.availability_zones))
  availability_zone = var.availability_zones[count.index]

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project}-${var.environment}-private-subnet-${count.index + 1}"
      Type = "private"
    }
  )
}

# Internet Gateway para acceso externo
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project}-${var.environment}-igw"
    }
  )
}

# Tabla de rutas pública
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project}-${var.environment}-public-rt"
    }
  )
}

# Asociación de subredes públicas con tabla de rutas
resource "aws_route_table_association" "public" {
  count = length(aws_subnet.public)

  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

// === ARCHIVO: modules/network/outputs.tf ===
# Salidas del módulo de red
# Exponen los IDs y ARNs necesarios para otros módulos

output "vpc_id" {
  description = "ID de la VPC principal"
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "Bloque CIDR de la VPC"
  value       = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
  description = "IDs de las subredes públicas"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "IDs de las subredes privadas"
  value       = aws_subnet.private[*].id
}

output "availability_zones" {
  description = "Zonas de disponibilidad utilizadas"
  value       = var.availability_zones
}

output "internet_gateway_id" {
  description = "ID del Internet Gateway"
  value       = aws_internet_gateway.main.id
}

output "public_route_table_id" {
  description = "ID de la tabla de rutas pública"
  value       = aws_route_table.public.id
}

// === ARCHIVO: modules/compute/main.tf ===
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


// === ARCHIVO: modules/compute/outputs.tf ===
# Outputs del módulo de compute
# Superficie de práctica: estudiante debe definir los outputs requeridos

output "instance_ids" {
  description = "IDs de las instancias EC2 creadas"
  value       = aws_instance.compute.*.id
}

output "public_ips" {
  description = "Direcciones IP públicas de las instancias"
  value       = aws_instance.compute.*.public_ip
}

output "private_ips" {
  description = "Direcciones IP privadas de las instancias"
  value       = aws_instance.compute.*.private_ip
}

output "security_group_id" {
  description = "ID del grupo de seguridad asociado a las instancias"
  value       = aws_security_group.compute_sg.id
}

output "iam_instance_profile" {
  description = "Nombre del perfil de instancia IAM"
  value       = aws_iam_instance_profile.compute_profile.name
}
// === ARCHIVO: environments/dev/terraform.tfvars ===
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
// === ARCHIVO: environments/prod/terraform.tfvars ===
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


// === ARCHIVO: scripts/healthcheck.sh ===
#!/bin/bash

set -euo pipefail

# ==============================================================================
# Script de verificación de disponibilidad de infraestructura
# Servicio de Notificaciones - AWS
# ==============================================================================

# Configuración de colores para salida
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly NC='\033[0m'

# Variables de entorno
ENVIRONMENT="${ENVIRONMENT:-dev}
AWS_REGION="${AWS_REGION:-us-east-1}"
STACK_NAME="notificaciones-${ENVIRONMENT}"
TIMEOUT=30
CHECK_INTERVAL=5

# Contadores para resultados
TOTAL_CHECKS=0
PASSED_CHECKS=0
FAILED_CHECKS=0

log_info() {
    echo -e "${BLUE}[INFO]${NC} $(date '+%Y-%m-%d %H:%M:%S') - $*"
}

log_success() {
    echo -e "${GREEN}[OK]${NC} $*"
    ((PASSED_CHECKS++))
}

log_warning() {
    echo -e "${YELLOW}[WARN]${NC} $*"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $*"
    ((FAILED_CHECKS++))
}

increment_check() {
    ((TOTAL_CHECKS++))
}

verificar_conectividad_aws() {
    log_info "Verificando conectividad con AWS..."
    increment_check
    
    if aws sts get-caller-identity --region "$AWS_REGION" > /dev/null 2>&1; then
        local account_id
        account_id=$(aws sts get-caller-identity --query 'Account' --output text --region "$AWS_REGION")
        local identity_arn
        identity_arn=$(aws sts get-caller-identity --query 'Arn' --output text --region "$AWS_REGION")
        log_success "Conectividad AWS verificada. Cuenta: ${account_id}, Identidad: ${identity_arn}"
        return 0
    else
        log_error "No se pudo conectar con AWS. Verifique credenciales y configuración."
        return 1
    fi
}

verificar_vpc() {
    log_info "Verificando VPC para el entorno ${ENVIRONMENT}..."
    increment_check
    
    local vpc_id
    vpc_id=$(aws ec2 describe-vpcs --filters "Name=tag:Name,Values=${STACK_NAME}-vpc" "Name=tag:Environment,Values=${ENVIRONMENT}" --query 'Vpcs[0].VpcId' --output text --region "$AWS_REGION" 2>/dev/null || echo "")
    
    if [[ -n "$vpc_id" && "$vpc_id" != "None" ]]; then
        local vpc_state
        vpc_state=$(aws ec2 describe-vpcs --vpc-ids "$vpc_id" --query 'Vpcs[0].State' --output text --region "$AWS_REGION")
        log_success "VPC ${vpc_id} encontrada y en estado: ${vpc_state}"
        echo "$vpc_id"
        return 0
    else
        log_error "VPC no encontrada para el stack ${STACK_NAME}"
        return 1
    fi
}

verificar_subnets() {
    local vpc_id="$1"
    log_info "Verificando subnets en VPC ${vpc_id}..."
    
    local subnet_count
    subnet_count=$(aws ec2 describe-subnets --filters "Name=vpc-id,Values=${vpc_id}" "Name=tag:Stack,Values=${STACK_NAME}" --query 'length(Subnets)' --output text --region "$AWS_REGION" 2>/dev/null || echo "0")
    
    increment_check
    if [[ "$subnet_count" -gt 0 ]]; then
        log_success "${subnet_count} subnets encontradas para el stack ${STACK_NAME}"
        
        local subnets
        subnets=$(aws ec2 describe-subnets --filters "Name=vpc-id,Values=${vpc_id}" "Name=tag:Stack,Values=${STACK_NAME}" --query 'Subnets[*].{ID:SubnetId,AZ:AvailabilityZone,State:State,CIDR:CidrBlock}' --output table --region "$AWS_REGION")
        log_info "Subnets configuradas:\n${subnets}"
        return 0
    else
        log_error "No se encontraron subnets para la VPC ${vpc_id}"
        return 1
    fi
}

verificar_security_groups() {
    local vpc_id="$1"
    log_info "Verificando security groups en VPC ${vpc_id}..."
    
    local sg_count
    sg_count=$(aws ec2 describe-security-groups --filters "Name=vpc-id,Values=${vpc_id}" "Name=tag:Stack,Values=${STACK_NAME}" --query 'length(SecurityGroups)' --output text --region "$AWS_REGION" 2>/dev/null || echo "0")
    
    increment_check
    if [[ "$sg_count" -gt 0 ]]; then
        log_success "${sg_count} security groups encontrados para el stack ${STACK_NAME}"
        
        local sgs
        sgs=$(aws ec2 describe-security-groups --filters "Name=vpc-id,Values=${vpc_id}" "Name=tag:Stack,Values=${STACK_NAME}" --query 'SecurityGroups[*].{Name:GroupName,ID:GroupId}' --output table --region "$AWS_REGION")
        log_info "Security Groups configurados:\n${sgs}"
        return 0
    else
        log_error "No se encontraron security groups para la VPC ${vpc_id}"
        return 1
    fi
}

verificar_instancias_ec2() {
    log_info "Verificando instancias EC2 del servicio de notificaciones..."
    
    local instancias
    instancias=$(aws ec2 describe-instances --filters "Name=tag:Stack,Values=${STACK_NAME}" "Name=instance-state-name,Values=running,pending" --query 'Reservations[*].Instances[*].{ID:InstanceId,Type:InstanceType,State:State.Name,AZ:Placement.AvailabilityZone,IP:PrivateIpAddress}' --output table --region "$AWS_REGION" 2>/dev/null || echo "")
    
    increment_check
    if [[ -n "$instancias" ]]; then
        log_success "Instancias EC2 encontradas:\n${instancias}"
        return 0
    else
        log_warning "No hay instancias EC2 en estado running/pending para el stack ${STACK_NAME}"
        return 1
    fi
}

verificar_elasticache() {
    log_info "Verificando recursos ElastiCache (Redis)..."
    
    local cache_cluster
    cache_cluster=$(aws elasticache describe-cache-clusters --cache-cluster-id "${STACK_NAME}-redis" --query 'CacheClusters[0].CacheClusterId' --output text --region "$AWS_REGION" 2>/dev/null || echo "")
    
    increment_check
    if [[ -n "$cache_cluster" && "$cache_cluster" != "None" ]]; then
        local cache_status
        cache_status=$(aws elasticache describe-cache-clusters --cache-cluster-id "${STACK_NAME}-redis" --query 'CacheClusters[0].CacheClusterStatus' --output text --region "$AWS_REGION")
        log_success "Redis cluster ${cache_cluster} encontrado en estado: ${cache_status}"
        return 0
    else
        log_warning "No se encontró cluster Redis para el stack ${STACK_NAME}"
        return 1
    fi
}

verificar_rds() {
    log_info "Verificando base de datos RDS..."
    
    local db_instance
    db_instance=$(aws rds describe-db-instances --db-instance-identifier "${STACK_NAME}-db" --query 'DBInstances[0].DBInstanceIdentifier' --output text --region "$AWS_REGION" 2>/dev/null || echo "")
    
    increment_check
    if [[ -n "$db_instance" && "$db_instance" != "None" ]]; then
        local db_status
        db_status=$(aws rds describe-db-instances --db-instance-identifier "${STACK_NAME}-db" --query 'DBInstances[0].DBInstanceStatus' --output text --region "$AWS_REGION")
        local db_endpoint
        db_endpoint=$(aws rds describe-db-instances --db-instance-identifier "${STACK_NAME}-db" --query 'DBInstances[0].Endpoint.Address' --output text --region "$AWS_REGION")
        log_success "RDS instance ${db_instance} encontrada en estado: ${db_status}"
        log_info "Endpoint: ${db_endpoint}"
        return 0
    else
        log_warning "No se encontró instancia RDS para el stack ${STACK_NAME}"
        return 1
    fi
}

verificar_balanceador_carga() {
    log_info "Verificando Application Load Balancer..."
    
    local alb_arn
    alb_arn=$(aws elbv2 describe-load-balancers --names "${STACK_NAME}-alb" --query 'LoadBalancers[0].LoadBalancerArn' --output text --region "$AWS_REGION" 2>/dev/null || echo "")
    
    increment_check
    if [[ -n "$alb_arn" && "$alb_arn" != "None" ]]; then
        local alb_state
        alb_state=$(aws elbv2 describe-load-balancers --names "${STACK_NAME}-alb" --query 'LoadBalancers[0].State.Code' --output text --region "$AWS_REGION")
        local alb_dns
        alb_dns=$(aws elbv2 describe-load-balancers --names "${STACK_NAME}-alb" --query 'LoadBalancers[0].DNSName' --output text --region "$AWS_REGION")
        log_success "ALB ${STACK_NAME}-alb encontrado en estado: ${alb_state}"
        log_info "DNS: ${alb_dns}"
        return 0
    else
        log_warning "No se encontró ALB para el stack ${STACK_NAME}"
        return 1
    fi
}

verificar_target_groups() {
    log_info "Verificando target groups del ALB..."
    
    local vpc_id
    vpc_id=$(aws ec2 describe-vpcs --filters "Name=tag:Name,Values=${STACK_NAME}-vpc" "Name=tag:Environment,Values=${ENVIRONMENT}" --query 'Vpcs[0].VpcId' --output text --region "$AWS_REGION" 2>/dev/null || echo "")
    
    if [[ -z "$vpc_id" || "$vpc_id" == "None" ]]; then
        log_warning "No se puede verificar target groups sin VPC"
        return 1
    fi
    
    local tg_count
    tg_count=$(aws elbv2 describe-target-groups --query 'length(TargetGroups)' --output text --region "$AWS_REGION" 2>/dev/null || echo "0")
    
    increment_check
    if [[ "$tg_count" -gt 0 ]]; then
        log_success "${tg_count} target groups configurados"
        return 0
    else
        log_warning "No se encontraron target groups"
        return 1
    fi
}

verificar_endpoints_servicio() {
    log_info "Verificando salud del servicio de notificaciones..."
    
    local alb_dns
    alb_dns=$(aws elbv2 describe-load-balancers --names "${STACK_NAME}-alb" --query 'LoadBalancers[0].DNSName' --output text --region "$AWS_REGION" 2>/dev/null || echo "")
    
    if [[ -z "$alb_dns" || "$alb_dns" == "None" ]]; then
        log_warning "No se puede verificar el servicio sin ALB"
        return 1
    fi
    
    increment_check
    local max_intentos=3
    local intento=1
    
    while [[ $intento -le $max_intentos ]]; do
        local http_code
        http_code=$(curl -s -o /dev/null -w "%{http_code}" --connect-timeout 5 "http://${alb_dns}/health" 2>/dev/null || echo "000")
        
        if [[ "$http_code" == "200" ]]; then
            log_success "Servicio de notificaciones respondiendo correctamente (HTTP ${http_code})"
            return 0
        else
            log_warning "Intento ${intento}/${max_intentos}: Servicio respondió con HTTP ${http_code}"
            ((intento++))
            sleep $CHECK_INTERVAL
        fi
    done
    
    log_error "Servicio de notificaciones no responde después de ${max_intentos} intentos"
    return 1
}

mostrar_resumen() {
    echo ""
    echo "============================================================"
    echo "              RESUMEN DE VERIFICACIÓN DE INFRAESTRUCTURA"
    echo "============================================================"
    echo -e " Entorno:    ${GREEN}${ENVIRONMENT}${NC}"
    echo -e " Región:     ${GREEN}${AWS_REGION}${NC}"
    echo -e " Stack:      ${GREEN}${STACK_NAME}${NC}"
    echo "------------------------------------------------------------"
    echo -e " Total Checks:  ${TOTAL_CHECKS}"
    echo -e " Exitosos:      ${GREEN}${PASSED_CHECKS}${NC}"
    echo -e " Fallidos:      ${RED}${FAILED_CHECKS}${NC}"
    echo "============================================================"
    
    if [[ $FAILED_CHECKS -eq 0 ]]; then
        echo -e "${GREEN}✓ Infraestructura desplegada y saludable${NC}"
        return 0
    else
        echo -e "${RED}✗ Se detectaron problemas en la infraestructura${NC}"
        return 1
    fi
}

main() {
    echo ""
    echo "============================================================"
    echo "    Healthcheck - Servicio de Notificaciones (${ENVIRONMENT})"
    echo "============================================================"
    echo ""
    
    log_info "Iniciando verificación de infraestructura..."
    log_info "Entorno: ${ENVIRONMENT}, Región: ${AWS_REGION}"
    echo ""
    
    verificar_conectividad_aws || exit 1
    
    local vpc_id
    vpc_id=$(verificar_vpc) || exit 1
    
    verificar_subnets "$vpc_id"
    verificar_security_groups "$vpc_id"
    verificar_instancias_ec2
    verificar_elasticache
    verificar_rds
    verificar_balanceador_carga
    verificar_target_groups
    verificar_endpoints_servicio
    
    mostrar_resumen
}

main "$@"

```
