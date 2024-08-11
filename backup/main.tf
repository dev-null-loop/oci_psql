resource "oci_psql_backup" "this" {
  compartment_id   = var.compartment_id
  db_system_id     = var.db_system_id
  display_name     = var.display_name
  defined_tags     = var.defined_tags
  description      = var.description
  freeform_tags    = var.freeform_tags
  retention_period = var.retention_period
}
