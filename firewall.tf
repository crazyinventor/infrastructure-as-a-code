resource "google_compute_firewall" "webserver" {
  name    = "webserver-firewall"
  network = google_compute_network.default-network.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["webserver"]
}

resource "google_compute_firewall" "ansible_webserver" {
  name    = "ansible-firewall"
  network = google_compute_network.default-network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}
