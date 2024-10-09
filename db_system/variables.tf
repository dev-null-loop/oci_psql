variable "tenancy_id" {
  description = "(Required) (Updatable) The OCID of the tenancy."
  type        = string
}

variable "compartment_id" {
  description = "(Required) (Updatable) The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment that contains the database system."
  type        = string
}

variable "credentials" {
  description = "(Optional) Initial database system credentials that the database system will be provisioned with. The password details are not visible on any subsequent operation, such as GET /dbSystems/{dbSystemId}."
  type = object({
    password_details = object({
      password       = string
      password_type  = string
      secret_id      = string
      secret_version = optional(number)
    })
    username = string
  })
}

variable "network_details" {
  description = "(Required) (Updatable) Network details for the database system."
  type = object({
    subnet_id                      = string
    nsg_ids                        = optional(list(string))
    primary_db_endpoint_private_ip = optional(string)
  })
}

variable "db_version" {
  description = "(Required) Version of DbSystem software."
  type        = number
}

variable "display_name" {
  description = "(Required) (Updatable) DbSystem display name"
  type        = string
}

variable "shape" {
  description = "(Required) Shape of DbInstance. This name should match from with one of the available shapes from /shapes API."
  type        = string
}

variable "config_id" {
  description = "Configuration identifier"
  type        = string
  default     = null
}

variable "description" {
  description = "(Optional) (Updatable) Description of a DbSystem. This field should be input by the user."
  type        = string
  default     = null
}

variable "system_type" {
  description = "(Optional) Type of the DbSystem."
  type        = string
  default     = "OCI_OPTIMIZED_STORAGE"
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

variable "instance_count" {
  description = "(Optional) Count of DbInstances to be created in the DbSystem."
  type        = number
  default     = 1
}

variable "instance_memory_size_in_gbs" {
  description = "(Optional) The total amount of memory available to each DbInstance, in gigabytes."
  type        = number
  default     = 32
}

variable "instance_ocpu_count" {
  description = "(Optional) The total number of OCPUs available to each DbInstance."
  type        = number
  default     = 2
}

variable "storage_details" {
  description = "(Required) (Updatable) Storage details of the database system."
  type = object({
    is_regionally_durable = bool
    system_type           = string
    availability_domain   = optional(number)
    iops                  = optional(number)
  })
  default = {
    is_regionally_durable = true
    system_type           = "OCI_OPTIMIZED_STORAGE"
    availability_domain   = 1
    iops                  = 300000
  }
}

variable "instances_details" {
  description = " (Optional) Details of DbInstances to be created. Optional parameter. If specified, its size must match instanceCount."
  type = map(object({
    description  = optional(string)
    display_name = optional(string)
    private_ip   = optional(string)
  }))
  default = {}
}

variable "backup_policy" {
  description = "(Optional) (Updatable) Posgresql DB system backup policy"
  type = map(object({
    backup_start      = optional(string)
    days_of_the_month = optional(list(number))
    days_of_the_week  = optional(list(string))
    kind              = optional(string)
    retention_days    = optional(number)
  }))
  default = {}
}

variable "maintenance_window_start" {
  description = "(Optional) (Updatable) The start of the maintenance window."
  type        = string
  default     = "SAT 08:00"
}

variable "db_system_source" {
  description = "(Optional) New source is used to restore the DB system."
  type = map(object({
    source_type                        = string
    backup_id                          = optional(string)
    is_having_restore_config_overrides = optional(string)
  }))
  default = {}
}
