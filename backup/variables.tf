variable "compartment_id" {
  description = "(Required) (Updatable) The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment that contains the backup."
  type        = string
}

variable "db_system_id" {
  description = "(Required) The ID of the database system."
  type        = string
  default     = null
}

variable "defined_tags" {
  description = "(Optional) (Updatable) Defined tags for this resource. Each key is predefined and scoped to a namespace. Example: `{\"foo-namespace.bar-key\": \"value\"}`"
  type        = map(string)
  default     = null
}

variable "description" {
  description = "(Optional) (Updatable) A description for the backup."
  type        = string
  default     = null
}

variable "display_name" {
  description = "(Required) (Updatable) A user-friendly display name for the backup. Avoid entering confidential information."
  type        = string
  default     = null
}

variable "freeform_tags" {
  description = "(Optional) (Updatable) Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only. Example: `{\"bar-key\": \"value\"}`"
  type        = map(string)
  default     = {}
}

variable "retention_period" {
  description = "(Optional) (Updatable) Backup retention period in days."
  type        = number
  default     = null
}

variable "source_backup_details" {
  description = "(Optional) Information about the Source Backup associated with a backup."
  type = object({
    source_backup_id = string
    source_region    = string
  })
  default = null
}
