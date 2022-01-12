provider "google" {
  alias   = "provider_alias"
  project = "project_id"
  region  = "asia-south1"
}

provider "kubernetes" {
  alias       = "provider_alias"
  config_path = "~/.kube/config"
}