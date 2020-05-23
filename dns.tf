resource "google_project_service" "dns_api" {
  project = var.google_project_name
  service = "dns.googleapis.com"
  disable_on_destroy = true
}

resource "google_dns_managed_zone" "davidschneider-info" {
  name        = "davidschneider-info"
  dns_name    = "davidschneider.info."

  depends_on = [
    google_project_service.dns_api
  ]
}

resource "google_dns_record_set" "davidschneider-info-root" {
  name = google_dns_managed_zone.davidschneider-info.dns_name
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.davidschneider-info.name

  rrdatas = [google_compute_address.webserver-ip-address.address]

  depends_on = [
    google_dns_managed_zone.davidschneider-info
  ]
}

resource "google_dns_record_set" "davidschneider-info-webserver-www" {
  name = "www.${google_dns_managed_zone.davidschneider-info.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.davidschneider-info.name

  rrdatas = [google_compute_address.webserver-ip-address.address]

  depends_on = [
    google_dns_managed_zone.davidschneider-info
  ]
}

resource "google_dns_managed_zone" "crazyinventor-net" {
  name        = "crazyinventor-net"
  dns_name    = "crazyinventor.net."

  depends_on = [
    google_project_service.dns_api
  ]
}

resource "google_dns_record_set" "crazyinventor-net-root" {
  name = google_dns_managed_zone.crazyinventor-net.dns_name
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.crazyinventor-net.name

  rrdatas = [google_compute_address.webserver-ip-address.address]

  depends_on = [
    google_dns_managed_zone.crazyinventor-net
  ]
}

resource "google_dns_record_set" "crazyinventor-net-webserver-www" {
  name = "www.${google_dns_managed_zone.crazyinventor-net.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.crazyinventor-net.name

  rrdatas = [google_compute_address.webserver-ip-address.address]

  depends_on = [
    google_dns_managed_zone.crazyinventor-net
  ]
}

resource "google_dns_record_set" "crazyinventor-net-webserver-bigbro" {
  name = "stage.bigbro.lab.${google_dns_managed_zone.crazyinventor-net.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.crazyinventor-net.name

  rrdatas = [google_compute_address.webserver-ip-address.address]

  depends_on = [
    google_dns_managed_zone.crazyinventor-net
  ]
}

resource "google_dns_record_set" "crazyinventor-net-webserver-bigbro-api" {
  name = "api.bigbro.lab.${google_dns_managed_zone.crazyinventor-net.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.crazyinventor-net.name

  rrdatas = [google_compute_address.webserver-ip-address.address]

  depends_on = [
    google_dns_managed_zone.crazyinventor-net
  ]
}

resource "google_dns_record_set" "davidschneider-info-webserver-stage-www" {
  name = "www.stage.${google_dns_managed_zone.davidschneider-info.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.davidschneider-info.name

  rrdatas = [google_compute_address.webserver-ip-address.address]

  depends_on = [
    google_dns_managed_zone.crazyinventor-net
  ]
}

resource "google_dns_record_set" "davidschneider-info-webserver-stage-db" {
  name = "db.stage.${google_dns_managed_zone.davidschneider-info.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.davidschneider-info.name

  rrdatas = [google_compute_address.webserver-ip-address.address]

  depends_on = [
    google_dns_managed_zone.davidschneider-info
  ]
}

resource "google_dns_record_set" "crazyinventor-net-webserver-service" {
  name = "example.lab.${google_dns_managed_zone.crazyinventor-net.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.crazyinventor-net.name

  rrdatas = [google_compute_address.webserver-ip-address.address]

  depends_on = [
    google_dns_managed_zone.crazyinventor-net
  ]
}

resource "google_dns_record_set" "crazyinventor-net-database" {
  name = "database.${google_dns_managed_zone.crazyinventor-net.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.crazyinventor-net.name

  rrdatas = [google_compute_address.database-ip-address.address]

  depends_on = [
    google_dns_managed_zone.crazyinventor-net
  ]
}
