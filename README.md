# GCP Server Group

## Using module
You can use this module like as below example.

```
module "your_asg" {
  source        = "youngookkim/gcp/asg"
  version       = "v1.0.0"

  name          = "yourasg"
  stack         = "dev"
  detail        = "mk1"
  region        = "us-central1"
  project       = "bxb-plm-poc"
  network       = "${module.vpc.id}"
  subnetwork    = "${lookup(module.vpc.private_subnets_map, "us-central1")}"
  ingress_rules = "${list(map("cidr", "0.0.0.0/0", "port", "443", "protocol", "tcp", "priority", "997"))}"
  metadata      = "${map("ansible-pull", "hello")}"
}

```
