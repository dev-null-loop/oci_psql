resource "oci_psql_configuration" "this" {
  compartment_id = var.compartment_id
  db_configuration_overrides {
    dynamic "items" {
      for_each = var.db_configuration_overrides.items
      iterator = it
      content {
        config_key             = it.value.config_key
        overriden_config_value = it.value.overriden_config_value
      }
    }
  }
  db_version                  = var.db_version
  display_name                = var.display_name
  compatible_shapes           = var.compatible_shapes
  defined_tags                = var.defined_tags
  description                 = var.description
  freeform_tags               = var.freeform_tags
  instance_memory_size_in_gbs = var.instance_memory_size_in_gbs
  instance_ocpu_count         = var.instance_ocpu_count
  is_flexible                 = var.is_flexible
  shape                       = var.shape
  system_tags                 = var.system_tags
}
