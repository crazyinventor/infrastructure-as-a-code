resource "google_compute_instance" "webserver" {

  allow_stopping_for_update = true

  name         = "webserver"
  machine_type = "g1-small"
  zone         = var.google_zone

  tags = ["webserver"]

  boot_disk {
    initialize_params {
      image = "ubuntu-1804-bionic-v20200129a"
    }
  }

  attached_disk {
    source      = google_compute_disk.webserver-data.self_link
    device_name = "webserver-data"
  }

  network_interface {
    subnetwork = google_compute_subnetwork.webserver-subnetwork.self_link
    access_config {
      nat_ip = google_compute_address.webserver-ip-address.address
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${var.webserver_ssh_key}"
  }

  depends_on    = [
    google_compute_address.webserver-ip-address,
    google_compute_disk.webserver-data
  ]
}

resource "google_compute_disk" "webserver-data" {
  name  = "webserver-data"
  type  = "pd-ssd"
  zone  = var.google_zone
  size  = "20"
  physical_block_size_bytes = 4096
}
