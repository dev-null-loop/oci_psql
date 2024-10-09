variable "tenancy_id" {
  description = "(Required) (Updatable) The OCID of the tenancy."
  type        = string
}

variable "compartment_id" {
  description = "(Required) (Updatable) The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment that contains the database system."
  type        = string
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

variable "subnet_id" {
  description = "(Required) Customer Subnet identifier"
  type        = string
}

variable "nsg_ids" {
  description = "(Optional) List of customer NetworkSecurityGroup identifiers"
  type        = list(string)
  default     = []
}

variable "primary_db_endpoint_private_ip" {
  description = "(Optional) Private IP in customer subnet. The value is optional. If the IP is not provided the IP will be chosen among the available IP addresses from the specified subnet."
  type        = string
  default     = null
}

variable "storage_details_is_regionally_durable" {
  description = "(Required) Specifies if the block volume used for the DbSystem is regional or AD-local. If not specified, it will be set to false. If isRegionallyDurable is set to true, availabilityDomain should not be specified. If isRegionallyDurable is set to false, availabilityDomain must be specified."
  type        = bool
  default     = true
}

variable "storage_details_system_type" {
  description = "(Required) Type of the DbSystem."
  type        = string
  default     = "OCI_OPTIMIZED_STORAGE"
}

variable "storage_details_ad" {
  description = "(Optional) Specifies the availability domain of AD-local storage. If isRegionallyDurable is set to true, availabilityDomain should not be specified. If isRegionallyDurable is set to false, availabilityDomain must be specified."
  type        = string
  default     = 1
}

variable "storage_details_iops" {
  description = "(Applicable when system_type=OCI_OPTIMIZED_STORAGE) (Updatable) DbSystem Performance Unit"
  type        = number
  default     = 300000
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
