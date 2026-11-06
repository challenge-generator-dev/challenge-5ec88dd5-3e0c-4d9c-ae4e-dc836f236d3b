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