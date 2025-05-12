resource "oci_psql_configuration" "this" {
  compartment_id = var.compartment_id
  db_configuration_overrides {
    dynamic "items" {
      for_each = var.items
      content {
	config_key             = items.key
	overriden_config_value = items.value
      }
    }
  }
  db_version                  = var.db_version
  display_name                = var.display_name
  shape                       = var.shape
  defined_tags                = var.defined_tags
  description                 = var.description
  freeform_tags               = var.freeform_tags
  instance_memory_size_in_gbs = var.instance_memory_size_in_gbs
  instance_ocpu_count         = var.instance_ocpu_count
  is_flexible                 = var.is_flexible
  system_tags                 = var.system_tags
}
