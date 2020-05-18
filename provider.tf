provider "google" {
  project     = var.google_project_name
  region      = var.google_region
  zone        = var.google_zone
  credentials = file("service-account.json")
}

terraform {
  backend "gcs" {
    bucket      = "crazyinventor-builds"
    prefix  = "terraform"
    credentials = "service-account.json"
  }
}
