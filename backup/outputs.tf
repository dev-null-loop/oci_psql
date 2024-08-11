output "id" {
  description = "Unique identifier that is immutable on creation"
  value       = oci_psql_backup.this.id
}
