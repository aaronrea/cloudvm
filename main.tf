provider "google" {
  #   credentials = file(var.credentials)
  project = var.project
  region  = var.region
  zone    = var.zone
}

resource "google_compute_instance" "vm_instance" {
  name           = "arch1"
  machine_type   = "f1-micro"
  can_ip_forward = "true"

  boot_disk {
    initialize_params {
      image = data.google_compute_image.arch.self_link
    }
  }

  network_interface {
    subnetwork = var.subnetwork
    access_config {
    }
  }
  tags = ["cloud-vm"]

  # metadata_startup_script = <<SCRIPT
  #   curl -o /wireguard-server.sh https://raw.githubusercontent.com/billimek/wireguard-install/master/wireguard-server.sh
  #   chmod a+x /wireguard-server.sh
  #   /wireguard-server.sh
  #   SCRIPT
}

data "google_compute_image" "arch" {
  family  = "arch"
  project = "arch-linux-gce"
}
# resource "google_compute_router" "router" {
#     name    = "router-nat-${var.region}-${var.project}"
#     region  = var.region
#     network = "default"
#     bgp {
#         asn = 64514
#     }
# }

# resource "google_compute_router_nat" "simple-nat" {
#   name                               = "nat-${var.region}-${var.project}"
#   router                             = google_compute_router.router.name
#   region                             = var.region
#   nat_ip_allocate_option             = "AUTO_ONLY"
#   source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
# }

# resource "google_compute_firewall" "allow-ssh-from-iap" {
#   name          = "allow-ssh-from-iap"
#   subnetwork       = "e1"
#   source_ranges = ["35.235.240.0/20"]
#   target_tags   = ["cloud-vm"]

#   allow {
#     protocol = "tcp"
#     ports    = ["22"]
#   }
# }

# resource "google_compute_firewall" "allow-wireguard" {
#   name          = "allow-wireguard"
#   network       = "default"
#   source_ranges = ["0.0.0.0/0"]
#   target_tags   = ["cloud-vm"]

#   allow {
#     protocol = "udp"
#     ports    = ["51820"]
#   }
# }
