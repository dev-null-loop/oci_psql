output "id" {
  description = "Unique identifier that is immutable on creation"
  value       = oci_psql_configuration.this.id
}

output "validate_items" {
  value = null

  precondition {
    condition     = alltrue([for k in keys(var.items) : contains(var.db_configuration_items, k)])
    error_message = "Error: key from items map is not a valid DB Configuration item."
  }
}
