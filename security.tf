# Seguridad del frontend
resource "aws_security_group" "frontend" {
  name        = "asistenciaweb-frontend-sg"
  description = "Acceso SSH, HTTP y HTTPS al frontend"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH desde IP autorizada"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip_cidr]
  }

  

  ingress {
    description = "HTTPS publico"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "asistenciaweb-frontend-sg"
  }
}

# Seguridad del backend
resource "aws_security_group" "backend" {
  name        = "asistenciaweb-backend-sg"
  description = "Acceso SSH y comunicacion desde el frontend"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH desde IP autorizada"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip_cidr]
  }

  ingress {
    description     = "Comunicacion desde frontend"
    from_port       = 3000
    to_port         = 3000
    protocol        = "tcp"
    security_groups = [aws_security_group.frontend.id]
  }

  ingress {
    description = "Acceso publico al backend"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "asistenciaweb-backend-sg"
  }
}
