variable "region" {
  description = "La región de AWS"
  default     = "us-east-1"
}

variable "alert_email" {
  description = "Correo electrónico para recibir las alertas"
  type        = string
}
