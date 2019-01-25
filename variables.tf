variable "module_name" {
  description = "Module name"
  type        = "string"
  default     = "default"
}

variable "stack_name" {
  description = "Stack name"
  type        = "string"
  default     = "default"
}

variable "project" {
  description = "The Id of project"
  type        = "string"
}

variable "region" {
  description = "A region to target"
  type        = "string"
}

variable "zone" {
  description = "A zone to target"
  type        = "string"
}

variable "network" {
  description = "An id of network to locate instances"
  type        = "string"
  default     = ""
}

variable "subnetwork" {
  description = "An id of subnetwork to locate instances"
  type        = "string"
}

variable "machine_type" {
  description = "A machine type what you want"
  type        = "string"
  default     = "n1-standard-1"
}

variable "machine_image" {
  description = "A machine image what you want"
  type        = "string"
  default     = "ubuntu-os-cloud/ubuntu-1604-lts"
}

variable "ssh_port" {
  description = "A port number of ssh access"
  type        = "string"
  default     = "22"
}

variable "labels" {
  description = "A map of labels to attache instances"
  type        = "map"

  default = {}
}

variable "metadata" {
  description = "A map of custom-metadata to attache instances"
  type        = "map"

  default = {}
}

variable "ingress_rules" {
  description = "A map of rules to allow inbound traffic"
  type        = "list"

  default = []
}

variable "egress_rules" {
  description = "A map of rules to allow outbound traffic"
  type        = "list"

  default = [
    {
      "cidr"     = "0.0.0.0/0"
      "port"     = "443"
      "protocol" = "tcp"
      "priority" = "997"
    },
    {
      "cidr"     = "0.0.0.0/0"
      "port"     = "80"
      "protocol" = "tcp"
      "priority" = "998"
    },
    {
      "cidr"     = "0.0.0.0/0"
      "port"     = "123"
      "protocol" = "udp"
      "priority" = "999"
    },
  ]
}
