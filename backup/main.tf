check "backup_source_mode" {
  assert {
    condition     = (var.db_system_id != null) != (var.source_backup_details != null)
    error_message = "Exactly one of db_system_id or source_backup_details must be provided."
  }
}

resource "oci_psql_backup" "this" {
  compartment_id   = var.compartment_id
  db_system_id     = var.db_system_id
  display_name     = var.display_name
  defined_tags     = var.defined_tags
  description      = var.description
  freeform_tags    = var.freeform_tags
  retention_period = var.retention_period

  dynamic "source_backup_details" {
    for_each = var.source_backup_details[*]
    iterator = sbd
    content {
      source_backup_id = sbd.value.source_backup_id
      source_region    = sbd.value.source_region
    }
  }
}
