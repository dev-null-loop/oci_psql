variable "compatible_shapes" {
  description = "(Optional) (Updatable) Indicates the collection of compatible shapes for this configuration."
  type        = list(string)
  default     = []
}

variable "compartment_id" {
  description = "(Required) (Updatable) The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment that contains the configuration."
  type        = string
}

variable "db_configuration_overrides" {
  description = "(Required) Configuration overrides for a PostgreSQL instance."
  type = object({
    items = list(object({
      config_key             = string
      overriden_config_value = string
    }))
  })
}

variable "db_version" {
  description = "(Required) Version of the PostgreSQL database."
  type        = string
}

variable "defined_tags" {
  description = "(Optional) (Updatable) Defined tags for this resource. Each key is predefined and scoped to a namespace. Example: `{\"foo-namespace.bar-key\": \"value\"}`"
  type        = map(string)
  default     = null
}

variable "description" {
  description = "(Optional) (Updatable) Details about the configuration set."
  type        = string
  default     = null
}

variable "display_name" {
  description = "(Required) (Updatable) A user-friendly display name for the configuration. Avoid entering confidential information."
  type        = string
}

variable "freeform_tags" {
  description = "(Optional) (Updatable) Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only. Example: `{\"bar-key\": \"value\"}`"
  type        = map(string)
  default     = {}
}

variable "instance_memory_size_in_gbs" {
  description = "(Optional) Memory size in gigabytes with 1GB increment.\n\nSkip or set it's value to 0 if configuration is for a flexible shape."
  type        = number
  default     = null
}

variable "instance_ocpu_count" {
  description = "(Optional) CPU core count.\n\nSkip or set it's value to 0 if configuration is for a flexible shape."
  type        = number
  default     = null
}

variable "is_flexible" {
  description = "(Optional) Whether the configuration supports flexible shapes."
  type        = bool
  default     = null
}

variable "shape" {
  description = "(Optional) The name of the shape for the configuration.\n\nFor multi-shape enabled configurations, it is set to PostgreSQL.X86 or similar. Please use compatibleShapes property to set the list of supported shapes."
  type        = string
  default     = null
}

variable "system_tags" {
  description = "(Optional) System tags for this resource. Each key is predefined and scoped to a namespace. Example: `{\"orcl-cloud.free-tier-retained\": \"true\"}`"
  type        = map(string)
  default     = null
}
