# Create Postgres Database Instance on Google Cloud
resource "google_sql_database_instance" "tf-cloud-sql-instance-name" {
  provider = google.provider_alias

  name                = "cloud-sql-instance-name"
  deletion_protection = "false"
  database_version    = "POSTGRES_13"
  region              = "asia-south1"
  project             = "project-id-where-we-need-to-spin-up-the-instance"

  settings {
    tier              = "db-custom-1-3840"
    availability_type = "ZONAL"
    disk_type         = "PD_SSD"
    disk_autoresize   = true
    ip_configuration {
      ipv4_enabled    = false
      private_network = "projects/project-id/global/networks/vpc-name"
    }
  }
  lifecycle {
    ignore_changes = [name, region, project, deletion_protection, database_version, settings.0.ip_configuration, settings.0.disk_type, settings.0.availability_type, settings.0.tier]
  }
}

# Creating DB-User
resource "google_sql_user" "tf-sql-db-user" {
  provider = google.provider_alias
  name     = "db-user-name"
  instance = google_sql_database_instance.tf-cloud-sql-instance-name.name
  password = "db-strong-password"
  project  = "project-id"
  lifecycle {
    ignore_changes = [name, instance, password, project]
  }
}

# Creating DB 
resource "google_sql_database" "tf-sql-db-name" {
  name     = "db-name"
  project  = "project-id"
  instance = google_sql_database_instance.tf-cloud-sql-instance-name.name
}