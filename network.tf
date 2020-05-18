resource "google_compute_network" "default-network" {
  name                    = "${var.project_internal_name}-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "public-subnetwork" {
  name          = var.project_internal_name
  ip_cidr_range = "10.0.0.0/24"
  region        = var.google_region
  network       = google_compute_network.default-network.self_link
  depends_on    = [
    google_compute_network.default-network
  ]
}
