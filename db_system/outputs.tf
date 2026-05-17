output "admin_username" {
  description = "The database system administrator username."
  value       = oci_psql_db_system.this.admin_username
}

output "compartment_id" {
  description = "The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment that contains the database system."
  value       = oci_psql_db_system.this.compartment_id
}

output "config_id" {
  description = "The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the configuration associated with the database system."
  value       = oci_psql_db_system.this.config_id
}

output "db_version" {
  description = "The major and minor versions of the database system software."
  value       = oci_psql_db_system.this.db_version
}

output "defined_tags" {
  description = "Defined tags for this resource. Each key is predefined and scoped to a namespace. Example: `{\"foo-namespace.bar-key\": \"value\"}`"
  value       = oci_psql_db_system.this.defined_tags
}

output "description" {
  description = "A description of the database system."
  value       = oci_psql_db_system.this.description
}

output "display_name" {
  description = "A user-friendly display name for the database system. Avoid entering confidential information."
  value       = oci_psql_db_system.this.display_name
}

output "freeform_tags" {
  description = "Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only. Example: `{\"bar-key\": \"value\"}`"
  value       = oci_psql_db_system.this.freeform_tags
}

output "id" {
  description = "A unique identifier for the database system. Immutable on creation."
  value       = oci_psql_db_system.this.id
}

output "instance_count" {
  description = "Count of instances, or nodes, in the database system."
  value       = oci_psql_db_system.this.instance_count
}

output "instance_memory_size_in_gbs" {
  description = "The total amount of memory available to each database instance node, in gigabytes."
  value       = oci_psql_db_system.this.instance_memory_size_in_gbs
}

output "instance_ocpu_count" {
  description = "The total number of OCPUs available to each database instance node."
  value       = oci_psql_db_system.this.instance_ocpu_count
}

output "instances" {
  description = "The list of instances, or nodes, in the database system."
  value       = oci_psql_db_system.this.instances
}

output "lifecycle_details" {
  description = "A message describing the current state in more detail. For example, can be used to provide actionable information for a resource in Failed state."
  value       = oci_psql_db_system.this.lifecycle_details
}

output "management_policy" {
  description = "PostgreSQL database system management policy."
  value       = oci_psql_db_system.this.management_policy
}

output "network_details" {
  description = "Network details for the database system."
  value       = oci_psql_db_system.this.network_details
}

output "shape" {
  description = "The name of the shape for the database instance. Example: `VM.Standard.E4.Flex`"
  value       = oci_psql_db_system.this.shape
}

output "source" {
  description = "The source of the database system."
  value       = oci_psql_db_system.this.source
}

output "state" {
  description = "The current state of the database system."
  value       = oci_psql_db_system.this.state
}

output "storage_details" {
  description = "Storage details of the database system."
  value       = oci_psql_db_system.this.storage_details
}

output "system_tags" {
  description = "System tags for this resource. Each key is predefined and scoped to a namespace. Example: `{\"orcl-cloud.free-tier-retained\": \"true\"}`"
  value       = oci_psql_db_system.this.system_tags
}

output "system_type" {
  description = "Type of the database system."
  value       = oci_psql_db_system.this.system_type
}

output "time_created" {
  description = "The date and time that the database system was created, expressed in RFC 3339 timestamp format."
  value       = oci_psql_db_system.this.time_created
}

output "time_updated" {
  description = "The date and time that the database system was updated, expressed in RFC 3339 timestamp format."
  value       = oci_psql_db_system.this.time_updated
}
