data "oci_identity_availability_domains" "these" {
  compartment_id = var.compartment_id
}

locals {
  ads = data.oci_identity_availability_domains.these.availability_domains
}

resource "oci_psql_db_system" "this" {
  compartment_id              = var.compartment_id
  db_version                  = var.db_version
  display_name                = var.display_name
  shape                       = var.shape
  config_id                   = var.config_id
  defined_tags                = var.defined_tags
  description                 = var.description
  freeform_tags               = var.freeform_tags
  instance_count              = var.instance_count
  instance_memory_size_in_gbs = var.instance_memory_size_in_gbs
  instance_ocpu_count         = var.instance_ocpu_count
  system_type                 = var.system_type

  network_details {
    nsg_ids                        = var.nsg_ids
    primary_db_endpoint_private_ip = var.primary_db_endpoint_private_ip
    subnet_id                      = var.subnet_id
  }

  storage_details {
    iops                  = var.storage_details_iops
    is_regionally_durable = var.storage_details_is_regionally_durable
    system_type           = var.storage_details_system_type
    availability_domain   = local.ads[var.storage_details_ad - 1].name
  }

  credentials {
    username = var.username
    password_details {
      password_type  = var.password_type
      password       = var.password_type == "PLAIN_TEXT" ? var.password : null
      secret_id      = (var.password_type == "VAULT_SECRET" ? var.secret_id : null)
      secret_version = var.password_type == "VAULT_SECRET" ? var.secret_version : null
    }
  }

  dynamic "instances_details" {
    for_each = var.instances_details[*]
    iterator = id
    content {
      description  = id.value.description
      display_name = id.value.display_name
      private_ip   = id.value.private_ip
    }
  }

  management_policy {
    dynamic "backup_policy" {
      for_each = var.backup_policy
      iterator = bp
      content {
	backup_start      = bp.value.backup_start
	days_of_the_month = bp.value.days_of_the_month
	days_of_the_week  = bp.value.days_of_the_week
	kind              = bp.value.kind
	retention_days    = bp.value.retention_days
      }
    }
    maintenance_window_start = var.maintenance_window_start
  }

  dynamic "source" {
    for_each = var.db_system_source
    iterator = i
    content {
      source_type                        = s.value.source_type
      backup_id                          = s.value.backup_id
      is_having_restore_config_overrides = s.value.is_having_restore_config_overrides
    }
  }
}
