# Don't forget to declare variables in, e.g., variables.tf

# variable "db_username" {
#   description = "Database administrator username"
#   type        = string
#   sensitive   = true
# }

# variable "db_password" {
#   description = "Database administrator password"
#   type        = string
#   sensitive   = true
# }

# invoke TF with a parameter, because it is not a standard name for tfvars file
# terraform apply -var-file="secret.tfvars"

db_username = "admin"
db_password = "insecurepassword"
