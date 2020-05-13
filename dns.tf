resource "google_dns_managed_zone" "davidschneider-info" {
  name        = "davidschneider-info"
  dns_name    = "davidschneider.info."
}

resource "google_dns_record_set" "davidschneider-info-root" {
  name = google_dns_managed_zone.davidschneider-info.dns_name
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.davidschneider-info.name

  rrdatas = [google_compute_instance.webserver.network_interface[0].access_config[0].nat_ip]

  depends_on = [
    google_compute_instance.webserver
  ]
}

resource "google_dns_record_set" "davidschneider-info-webserver-www" {
  name = "www.${google_dns_managed_zone.davidschneider-info.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.davidschneider-info.name

  rrdatas = [google_compute_instance.webserver.network_interface[0].access_config[0].nat_ip]

  depends_on = [
    google_compute_instance.webserver
  ]
}

resource "google_dns_managed_zone" "crazyinventor-net" {
  name        = "crazyinventor-net"
  dns_name    = "crazyinventor.net."
}

resource "google_dns_record_set" "crazyinventor-net-root" {
  name = google_dns_managed_zone.crazyinventor-net.dns_name
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.crazyinventor-net.name

  rrdatas = [google_compute_instance.webserver.network_interface[0].access_config[0].nat_ip]

  depends_on = [
    google_compute_instance.webserver
  ]
}

resource "google_dns_record_set" "crazyinventor-net-webserver-www" {
  name = "www.${google_dns_managed_zone.crazyinventor-net.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.crazyinventor-net.name

  rrdatas = [google_compute_instance.webserver.network_interface[0].access_config[0].nat_ip]

  depends_on = [
    google_compute_instance.webserver
  ]
}

resource "google_dns_record_set" "crazyinventor-net-webserver-bigbro" {
  name = "stage.bigbro.lab.${google_dns_managed_zone.crazyinventor-net.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.crazyinventor-net.name

  rrdatas = [google_compute_instance.webserver.network_interface[0].access_config[0].nat_ip]

  depends_on = [
    google_compute_instance.webserver
  ]
}

resource "google_dns_record_set" "crazyinventor-net-webserver-bigbro-api" {
  name = "api.bigbro.lab.${google_dns_managed_zone.crazyinventor-net.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.crazyinventor-net.name

  rrdatas = [google_compute_instance.webserver.network_interface[0].access_config[0].nat_ip]

  depends_on = [
    google_compute_instance.webserver
  ]
}

resource "google_dns_record_set" "davidschneider-info-webserver-stage-www" {
  name = "www.stage.${google_dns_managed_zone.davidschneider-info.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.davidschneider-info.name

  rrdatas = [google_compute_instance.webserver.network_interface[0].access_config[0].nat_ip]

  depends_on = [
    google_compute_instance.webserver
  ]
}

resource "google_dns_record_set" "davidschneider-info-webserver-stage-db" {
  name = "db.stage.${google_dns_managed_zone.davidschneider-info.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.davidschneider-info.name

  rrdatas = [google_compute_instance.webserver.network_interface[0].access_config[0].nat_ip]

  depends_on = [
    google_compute_instance.webserver
  ]
}

resource "google_dns_record_set" "crazyinventor-net-webserver-service" {
  name = "example.lab.${google_dns_managed_zone.crazyinventor-net.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.crazyinventor-net.name

  rrdatas = [google_compute_instance.webserver.network_interface[0].access_config[0].nat_ip]

  depends_on = [
    google_compute_instance.webserver
  ]
}
