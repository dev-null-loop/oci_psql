output "compartment_id" {
  description = "The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment that contains the configuration."
  value       = oci_psql_configuration.this.compartment_id
}

output "compatible_shapes" {
  description = "Indicates the collection of compatible shapes for this configuration."
  value       = oci_psql_configuration.this.compatible_shapes
}

output "config_type" {
  description = "The type of configuration. Either user-created or a default configuration."
  value       = oci_psql_configuration.this.config_type
}

output "configuration_details" {
  description = "List of configuration details."
  value       = oci_psql_configuration.this.configuration_details
}

output "db_version" {
  description = "Version of the PostgreSQL database."
  value       = oci_psql_configuration.this.db_version
}

output "default_config_id" {
  description = "The Default configuration used for this configuration."
  value       = oci_psql_configuration.this.default_config_id
}

output "defined_tags" {
  description = "Defined tags for this resource. Each key is predefined and scoped to a namespace. Example: `{\"foo-namespace.bar-key\": \"value\"}`"
  value       = oci_psql_configuration.this.defined_tags
}

output "description" {
  description = "A description for the configuration."
  value       = oci_psql_configuration.this.description
}

output "display_name" {
  description = "A user-friendly display name for the configuration. Avoid entering confidential information."
  value       = oci_psql_configuration.this.display_name
}

output "freeform_tags" {
  description = "Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only. Example: `{\"bar-key\": \"value\"}`"
  value       = oci_psql_configuration.this.freeform_tags
}

output "id" {
  description = "A unique identifier for the configuration. Immutable on creation."
  value       = oci_psql_configuration.this.id
}

output "instance_memory_size_in_gbs" {
  description = "Memory size in gigabytes with 1GB increment.\n\nIt's value is set to 0 if configuration is for a flexible shape."
  value       = oci_psql_configuration.this.instance_memory_size_in_gbs
}

output "instance_ocpu_count" {
  description = "CPU core count.\n\nIt's value is set to 0 if configuration is for a flexible shape."
  value       = oci_psql_configuration.this.instance_ocpu_count
}

output "is_flexible" {
  description = "Whether the configuration supports flexible shapes."
  value       = oci_psql_configuration.this.is_flexible
}

output "lifecycle_details" {
  description = "A message describing the current state in more detail. For example, can be used to provide actionable information for a resource in Failed state."
  value       = oci_psql_configuration.this.lifecycle_details
}

output "shape" {
  description = "The name of the shape for the configuration.\n\nFor multi-shape enabled configurations, it is set to PostgreSQL. Please use compatibleShapes property to get list of supported shapes for such configurations."
  value       = oci_psql_configuration.this.shape
}

output "state" {
  description = "The current state of the configuration."
  value       = oci_psql_configuration.this.state
}

output "system_tags" {
  description = "System tags for this resource. Each key is predefined and scoped to a namespace. Example: `{\"orcl-cloud.free-tier-retained\": \"true\"}`"
  value       = oci_psql_configuration.this.system_tags
}

output "time_created" {
  description = "The date and time that the configuration was created, expressed in RFC 3339 timestamp format."
  value       = oci_psql_configuration.this.time_created
}
