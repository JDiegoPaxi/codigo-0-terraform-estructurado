# Salidas
output "frontend_public_ip" {
  description = "IP publica del frontend"
  value       = aws_instance.frontend.public_ip
}

output "frontend_url" {
  description = "Direccion HTTP del frontend"
  value       = "http://${aws_instance.frontend.public_ip}"
}

output "backend_public_ip" {
  description = "IP publica del backend"
  value       = aws_instance.backend.public_ip
}

output "backend_private_ip" {
  description = "IP privada del backend"
  value       = aws_instance.backend.private_ip
}
