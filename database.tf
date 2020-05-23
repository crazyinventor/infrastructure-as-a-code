resource "google_compute_instance" "database" {

  allow_stopping_for_update = true

  name         = "database"
  machine_type = "g1-small"
  zone         = var.google_zone

  tags = ["database"]

  boot_disk {
    initialize_params {
      image = "ubuntu-1804-bionic-v20200129a"
    }
  }

  attached_disk {
    source      = google_compute_disk.database-data.self_link
    device_name = "database-data"
  }

  network_interface {
    subnetwork = google_compute_subnetwork.public-subnetwork.self_link
    access_config {
      nat_ip = google_compute_address.database-ip-address.address
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${var.access_ssh_key}"
  }

  depends_on    = [
    google_compute_address.database-ip-address,
    google_compute_disk.database-data
  ]
}

resource "google_compute_disk" "database-data" {
  name  = "database-data"
  type  = "pd-ssd"
  zone  = var.google_zone
  size  = "20"
  physical_block_size_bytes = 4096
}

resource "google_compute_address" "database-ip-address" {
  name         = "${var.project_internal_name}-database"
  region       = var.google_region
  depends_on    = [
    google_compute_subnetwork.public-subnetwork
  ]
}
