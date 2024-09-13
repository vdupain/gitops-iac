locals {
  factory_url = "https://factory.talos.dev"

  platform  = "nocloud"
  arch      = "amd64"
  version   = "v1.7.6"
  schematic = file("schematic.yaml")

  schematic_id = jsondecode(data.http.schematic_id.response_body)["id"]
  image_id     = "${local.schematic_id}_${local.version}"
}

data "http" "schematic_id" {
  url          = "${local.factory_url}/schematics"
  method       = "POST"
  request_body = local.schematic
}

resource "proxmox_virtual_environment_download_file" "this" {
  for_each = toset(distinct([for v in var.vms : "${v.host_node}"]))

  node_name               = each.key
  content_type            = "iso"
  datastore_id            = "local"
  decompression_algorithm = "gz"
  overwrite               = false

  url       = "${local.factory_url}/image/${local.schematic_id}/${local.version}/${local.platform}-${local.arch}.raw.gz"
  file_name = "talos-${local.schematic_id}-${local.version}-${local.platform}-${local.arch}.img"
}
