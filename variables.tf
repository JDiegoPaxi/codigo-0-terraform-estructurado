variable "aws_region" {
  description = "Region de AWS"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "Bloque CIDR de la VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Bloque CIDR de la subred pública"
  type        = string
  default     = "10.0.1.0/24"
}

variable "my_ip_cidr" {
  description = "IP publica autorizada para SSH"
  type        = string
  default     = "166.114.174.35/32"
}

variable "key_name" {
  description = "Nombre del par de claves existente en AWS"
  type        = string
  default     = "asistenciaweb-key"
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
  default     = "t3.micro"
}
