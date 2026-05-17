variable "apply_config" {
  description = "Whether a configuration update requires a restart of the database instance or a reload of the configuration. Some configuration changes require a restart of database instances to be applied. Apply config can be passed as `RESTART` or `RELOAD`"
  type        = string
  default     = null
}

variable "compartment_id" {
  description = "The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment that contains the database system."
  type        = string
}

variable "config_id" {
  description = "The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the configuration associated with the database system."
  type        = string
  default     = null
}

variable "credentials" {
  description = "Initial database system credentials that the database system will be provisioned with. The password details are not visible on any subsequent operation, such as GET /dbSystems/{dbSystemId}."
  type = object({
    password_details = object({
      password_type  = string
      password       = optional(string)
      secret_id      = optional(string)
      secret_version = optional(string)
    })
    username = string
  })
  default = null

  validation {
    condition     = var.credentials == null || contains(["PLAIN_TEXT", "VAULT_SECRET"], upper(var.credentials.password_details.password_type))
    error_message = "credentials.password_details.password_type must be one of: PLAIN_TEXT, VAULT_SECRET."
  }

  validation {
    condition = var.credentials == null || upper(var.credentials.password_details.password_type) != "PLAIN_TEXT" || (
      try(var.credentials.password_details.password, null) != null
    )
    error_message = "credentials.password_details.password must be provided when password_type is PLAIN_TEXT."
  }

  validation {
    condition = var.credentials == null || upper(var.credentials.password_details.password_type) != "VAULT_SECRET" || (
      try(var.credentials.password_details.secret_id, null) != null &&
      try(var.credentials.password_details.secret_version, null) != null
    )
    error_message = "credentials.password_details.secret_id and secret_version must be provided when password_type is VAULT_SECRET."
  }
}

variable "db_version" {
  description = "Version of database system software."
  type        = string
}

variable "defined_tags" {
  description = "Defined tags for this resource. Each key is predefined and scoped to a namespace. Example: `{\"foo-namespace.bar-key\": \"value\"}`"
  type        = map(string)
  default     = null
}

variable "description" {
  description = "A user-provided description of a database system."
  type        = string
  default     = null
}

variable "display_name" {
  description = "A user-friendly display name for the database system. Avoid entering confidential information."
  type        = string
}

variable "freeform_tags" {
  description = "Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only. Example: `{\"bar-key\": \"value\"}`"
  type        = map(string)
  default     = {}
}

variable "instance_count" {
  description = "Count of database instances nodes to be created in the database system."
  type        = number
  default     = null
}

variable "instance_memory_size_in_gbs" {
  description = "The total amount of memory available to each database instance node, in gigabytes."
  type        = number
  default     = null
}

variable "instance_ocpu_count" {
  description = "The total number of OCPUs available to each database instance node."
  type        = number
  default     = null
}

variable "instances_details" {
  description = "Details of database instances nodes to be created. This parameter is optional. If specified, its size must match `instanceCount`."
  type = list(object({
    description  = optional(string)
    display_name = optional(string)
    private_ip   = optional(string)
  }))
  default = []
}

variable "management_policy" {
  description = "PostgreSQL database system management policy update details."
  type = object({
    backup_policy = optional(object({
      backup_start = optional(string)
      copy_policy = optional(object({
        compartment_id   = string
        regions          = list(string)
        retention_period = optional(number)
      }))
      days_of_the_month = optional(list(number))
      days_of_the_week  = optional(list(string))
      kind              = optional(string)
      retention_days    = optional(number)
    }))
    maintenance_window_start = optional(string)
  })
  default = null
}

variable "network_details" {
  description = "Network details for the database system."
  type = object({
    is_reader_endpoint_enabled     = optional(bool)
    nsg_ids                        = optional(list(string))
    primary_db_endpoint_private_ip = optional(string)
    subnet_id                      = string
  })
}

variable "patch_operations" {
  description = "For adding and removing from read replica database instances. Please remove the patch_operations after it is applied. Update the instance_count arrodrandly. Cannot be specified when creating the resource."
  type = list(object({
    operation     = string
    selection     = string
    value         = optional(map(string))
    from          = optional(string)
    position      = optional(string)
    selected_item = optional(string)
  }))
  default = []
}

variable "shape" {
  description = "The name of the shape for the database instance node. Use the /shapes API for accepted shapes. Example: `VM.Standard.E4.Flex`"
  type        = string
}

variable "source_details" {
  description = "The source of the database system."
  type = object({
    backup_id                          = optional(string)
    is_having_restore_config_overrides = optional(bool)
    source_type                        = string
  })
  default = null
}

variable "storage_details" {
  description = "Storage details of the database system."
  type = object({
    availability_domain   = optional(string)
    iops                  = optional(string)
    is_regionally_durable = bool
    system_type           = string
  })
}

variable "system_type" {
  description = "Type of the database system."
  type        = string
  default     = null
}
