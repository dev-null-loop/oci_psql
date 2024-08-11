output "id" {
  description = "Unique identifier that is immutable on creation"
  value       = oci_psql_db_system.this.id
}
