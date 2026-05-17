resource "oci_psql_db_system" "this" {
  compartment_id              = var.compartment_id
  db_version                  = var.db_version
  display_name                = var.display_name
  shape                       = var.shape
  config_id                   = var.config_id
  apply_config                = var.apply_config
  defined_tags                = var.defined_tags
  description                 = var.description
  freeform_tags               = var.freeform_tags
  instance_count              = var.instance_count
  instance_memory_size_in_gbs = var.instance_memory_size_in_gbs
  instance_ocpu_count         = var.instance_ocpu_count
  system_type                 = var.system_type
  network_details {
    subnet_id                      = var.network_details.subnet_id
    is_reader_endpoint_enabled     = var.network_details.is_reader_endpoint_enabled
    nsg_ids                        = var.network_details.nsg_ids
    primary_db_endpoint_private_ip = var.network_details.primary_db_endpoint_private_ip
  }
  storage_details {
    is_regionally_durable = var.storage_details.is_regionally_durable
    system_type           = var.storage_details.system_type
    availability_domain   = var.storage_details.availability_domain
    iops                  = var.storage_details.iops
  }
  dynamic "credentials" {
    for_each = var.credentials[*]
    iterator = cr
    content {
      username = cr.value.username
      password_details {
        password_type  = cr.value.password_details.password_type
        password       = cr.value.password_details.password_type == "PLAIN_TEXT" ? cr.value.password_details.password : null
        secret_id      = cr.value.password_details.password_type == "VAULT_SECRET" ? cr.value.password_details.secret_id : null
        secret_version = cr.value.password_details.password_type == "VAULT_SECRET" ? cr.value.password_details.secret_version : null
      }
    }
  }
  dynamic "instances_details" {
    for_each = var.instances_details
    iterator = id
    content {
      description  = id.value.description
      display_name = id.value.display_name
      private_ip   = id.value.private_ip
    }
  }
  dynamic "management_policy" {
    for_each = var.management_policy[*]
    iterator = mp
    content {
      dynamic "backup_policy" {
        for_each = mp.value.backup_policy[*]
        iterator = bp
        content {
          backup_start      = bp.value.backup_start
          days_of_the_month = bp.value.days_of_the_month
          days_of_the_week  = bp.value.days_of_the_week
          kind              = bp.value.kind
          retention_days    = bp.value.retention_days
          dynamic "copy_policy" {
            for_each = bp.value.copy_policy[*]
            iterator = cp
            content {
              compartment_id   = cp.value.compartment_id
              regions          = cp.value.regions
              retention_period = cp.value.retention_period
            }
          }
        }
      }
      maintenance_window_start = mp.value.maintenance_window_start
    }
  }
  dynamic "patch_operations" {
    for_each = var.patch_operations
    iterator = po
    content {
      operation     = po.value.operation
      selection     = po.value.selection
      value         = po.value.value
      from          = po.value.from
      position      = po.value.position
      selected_item = po.value.selected_item
    }
  }
  dynamic "source" {
    for_each = var.source_details[*]
    iterator = so
    content {
      source_type                        = so.value.source_type
      backup_id                          = so.value.backup_id
      is_having_restore_config_overrides = so.value.is_having_restore_config_overrides
    }
  }
}
