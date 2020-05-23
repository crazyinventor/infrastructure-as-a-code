resource "google_compute_firewall" "ansible" {
  name    = "ansible"
  network = google_compute_network.default-network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "database" {
  name    = "database-firewall"
  network = google_compute_network.default-network.name

  allow {
    protocol = "tcp"
    ports    = ["3306"]
  }

  source_ranges = ["${google_compute_address.webserver-ip-address.address}/32"]
  target_tags   = ["database"]
}

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
