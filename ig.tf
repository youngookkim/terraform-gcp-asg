# Instances group for micro-service

### bootstrap script
data "template_file" "servergroup-startup-sh" {
  template = "${file("${path.module}/startup.tpl")}"

  vars {
    ssh_port = "${var.ssh_port}"
  }
}

### instance template
resource "google_compute_instance_template" "servergroup" {
  name_prefix    = "${var.module_name}-${var.stack_name}-igt-"
  description    = "This template is used to create app instances for ${var.module_name}"
  region         = "${var.region}"
  machine_type   = "${var.machine_type}"
  can_ip_forward = false

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  disk {
    source_image = "${var.machine_image}"
    auto_delete  = true
    boot         = true
  }

  network_interface {
    network            = "${var.subnetwork == "" ? var.network : ""}"
    subnetwork         = "${var.subnetwork}"
    subnetwork_project = "${var.project}"
  }

  lifecycle {
    create_before_destroy = true
  }

  labels   = "${var.labels}"
  metadata = "${var.metadata}"

  metadata_startup_script = "${data.template_file.servergroup-startup-sh.rendered}"
}

### instance group manager
resource "google_compute_instance_group_manager" "servergroup" {
  name               = "${var.module_name}-${var.stack_name}-igm"
  instance_template  = "${google_compute_instance_template.servergroup.self_link}"
  base_instance_name = "${var.module_name}-${var.stack_name}-app"
  zone               = "${var.zone}"
  target_size        = "1"
}
