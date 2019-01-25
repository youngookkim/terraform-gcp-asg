# Instances group for micro-service

### inbound firewall rules
resource "google_compute_firewall" "servergroup-ingress" {
  count     = "${length(var.ingress_rules)}"
  name      = "${var.module_name}-${var.stack_name}-ingress${count.index}"
  network   = "${var.network}"
  direction = "INGRESS"

  allow {
    protocol = "${lookup(var.ingress_rules[count.index], "protocol")}"
    ports    = ["${lookup(var.ingress_rules[count.index], "port")}"]
  }

  source_ranges = ["${lookup(var.ingress_rules[count.index], "cidr")}"]
  priority      = "${lookup(var.ingress_rules[count.index], "priority")}"
}

### outbound firewall rules
resource "google_compute_firewall" "servergroup-egress" {
  count     = "${length(var.egress_rules)}"
  name      = "${var.module_name}-${var.stack_name}-engress${count.index}"
  network   = "${var.network}"
  direction = "EGRESS"

  allow {
    protocol = "${lookup(var.egress_rules[count.index], "protocol")}"
    ports    = ["${lookup(var.egress_rules[count.index], "port")}"]
  }

  destination_ranges = ["${lookup(var.egress_rules[count.index], "cidr")}"]
  priority           = "${lookup(var.egress_rules[count.index], "priority")}"
}
