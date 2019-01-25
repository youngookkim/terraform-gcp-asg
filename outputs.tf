output "servergroup_id" {
  description = "Identity of this servergroup"
  value       = "${google_compute_instance_group_manager.servergroup.self_link}"
}
