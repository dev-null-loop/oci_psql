output "backup_size" {
  description = "The size of the backup, in gigabytes."
  value       = oci_psql_backup.this.backup_size
}

output "compartment_id" {
  description = "The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the compartment that contains the backup."
  value       = oci_psql_backup.this.compartment_id
}

output "copy_status" {
  description = "List of status for Backup Copy."
  value       = oci_psql_backup.this.copy_status
}

output "db_system_details" {
  description = "Information about the database system associated with a backup."
  value       = oci_psql_backup.this.db_system_details
}

output "db_system_id" {
  description = "The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the backup's source database system."
  value       = oci_psql_backup.this.db_system_id
}

output "defined_tags" {
  description = "Defined tags for this resource. Each key is predefined and scoped to a namespace. Example: `{\"foo-namespace.bar-key\": \"value\"}`"
  value       = oci_psql_backup.this.defined_tags
}

output "description" {
  description = "A description for the backup."
  value       = oci_psql_backup.this.description
}

output "display_name" {
  description = "A user-friendly display name for the backup. Avoid entering confidential information."
  value       = oci_psql_backup.this.display_name
}

output "freeform_tags" {
  description = "Simple key-value pair that is applied without any predefined name, type or scope. Exists for cross-compatibility only. Example: `{\"bar-key\": \"value\"}`"
  value       = oci_psql_backup.this.freeform_tags
}

output "id" {
  description = "The [OCID](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/identifiers.htm) of the backup."
  value       = oci_psql_backup.this.id
}

output "last_accepted_request_token" {
  description = "lastAcceptedRequestToken from MP."
  value       = oci_psql_backup.this.last_accepted_request_token
}

output "last_completed_request_token" {
  description = "lastCompletedRequestToken from MP."
  value       = oci_psql_backup.this.last_completed_request_token
}

output "lifecycle_details" {
  description = "A message describing the current state in more detail. For example, can be used to provide actionable information for a resource in Failed state."
  value       = oci_psql_backup.this.lifecycle_details
}

output "retention_period" {
  description = "Backup retention period in days."
  value       = oci_psql_backup.this.retention_period
}

output "source_backup_details" {
  description = "Information about the Source Backup associated with a backup."
  value       = oci_psql_backup.this.source_backup_details
}

output "source_type" {
  description = "Specifies whether the backup was created manually, taken on schedule defined in the a backup policy, or copied from the remote location."
  value       = oci_psql_backup.this.source_type
}

output "state" {
  description = "The current state of the backup."
  value       = oci_psql_backup.this.state
}

output "system_tags" {
  description = "System tags for this resource. Each key is predefined and scoped to a namespace. Example: `{\"orcl-cloud.free-tier-retained\": \"true\"}`"
  value       = oci_psql_backup.this.system_tags
}

output "time_created" {
  description = "The date and time the backup request was received, expressed in RFC 3339 timestamp format."
  value       = oci_psql_backup.this.time_created
}

output "time_created_precise" {
  description = "The date and time the backup was created. This is the time the actual point-in-time data snapshot was taken, expressed in RFC 3339 timestamp format."
  value       = oci_psql_backup.this.time_created_precise
}

output "time_updated" {
  description = "The date and time the backup was updated, expressed in RFC 3339 timestamp format."
  value       = oci_psql_backup.this.time_updated
}
