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