variable "compartment_id" {
  description = "(Required) (Updatable) Compartment identifier"
  type        = string
}

variable "db_system_id" {
  description = "(Required) Posgresql DbSystem identifier"
  type        = string
}

variable "display_name" {
  description = "(Required) (Updatable) Backup display name."
  type        = string
}
variable "description" {
  description = "(Optional) (Updatable) Backup description"
  type        = string
  default     = null
}

variable "defined_tags" {
  description = "(Optional) (Updatable) Defined tags for this resource. Each key is predefined and scoped to a namespace."
  type        = map(string)
  default     = {}
}

variable "freeform_tags" {
  description = "(Optional) (Updatable) Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only."
  type        = map(string)
  default     = {}
}

variable "retention_period" {
  description = "(Optional) (Updatable) Backup retention period in days."
  type        = number
  default     = 1
}
