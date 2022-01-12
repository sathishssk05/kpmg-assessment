# Fetch and Keep the latest & stable Master components version
data "google_container_engine_versions" "asiasouth1" {
  provider       = google.provider_alias
  location       = "asia-south1"
  version_prefix = "1.20.9-gke.1000"
}
# GKE cluster
resource "google_container_cluster" "tf-gke-cluster-name" {
  provider                 = google.provider_alias
  name                     = "gke-cluster-name"
  location                 = "asia-south1"
  min_master_version       = data.google_container_engine_versions.asiasouth1.latest_node_version
  remove_default_node_pool = true
  addons_config {
    cloudrun_config {
      disabled = "true"
    }
    http_load_balancing {
      disabled = "false"
    }
  }
  initial_node_count = 1
  node_locations = [
    "asia-south1-a"
  ]
  private_cluster_config {
    enable_private_endpoint = "true"
    enable_private_nodes    = "true"
    master_ipv4_cidr_block  = "10.237.144.0/28"
  }
  master_authorized_networks_config {
    cidr_blocks {
      display_name = "HO network"
      cidr_block   = "172.19.0.0/16"
    }
  }
  release_channel {
    channel = "UNSPECIFIED"
  }
  logging_service    = "logging.googleapis.com/kubernetes"
  monitoring_service = "monitoring.googleapis.com/kubernetes"
  network            = "projects/devstaging-host/global/networks/vpc-name"
  subnetwork         = "projects/devstaging-host/regions/asia-south1/subnetworks/subnet-name"

  ip_allocation_policy {
    cluster_secondary_range_name  = "secondary-range-for-pods"
    services_secondary_range_name = "secondary-range-for-svc"
  }

  lifecycle {
    ignore_changes = [master_auth, network_policy, private_cluster_config, ip_allocation_policy, network, subnetwork, name, remove_default_node_pool]
  }
}

# Create Nodepool for Workloads
resource "google_container_node_pool" "tf-gke-nodepool-name" {
  provider           = google.provider_alias
  name               = "nodepool-name"
  location           = "asia-south1"
  cluster            = google_container_cluster.tf-gke-cluster-name.name
  version            = data.google_container_engine_versions.asiasouth1.latest_node_version
  initial_node_count = "1"
  max_pods_per_node  = "16"

  management {
    auto_repair  = "true"
    auto_upgrade = "false"
  }
  autoscaling {
    min_node_count = "1"
    max_node_count = "5"
  }
  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/cloud-platform",
    ]

    labels = {
      nodepool = "any-label-name"
    }
    machine_type    = "n1-standard-4"
    disk_type       = "pd-standard"
    disk_size_gb    = "30"
    tags            = ["gke-node"] # Firewall Network Tags for Inbound Traffics to Nodes
    service_account = "service-account-for-other-api-access@developer.gserviceaccount.com"
    metadata = {
      "disable-legacy-endpoints" = "true"
    }
    taint {
      key    = "taint-key"
      value  = "taint-value"
      effect = "NO_SCHEDULE"
    }
  }
  lifecycle {
    ignore_changes = [node_count, name, location, cluster, management, initial_node_count, node_config[0].service_account, node_config[0].machine_type, node_config[0].disk_type, node_config[0].disk_size_gb, node_config[0].tags, node_config[0].taint, node_config[0].labels]
  }
}

## Namespace Added for App
resource "kubernetes_namespace" "tf-ns-shield-apps" {
  provider = kubernetes.provider_alias
  metadata {
    name = "shield-apps"
  }
}

## Namespace Added for Web Layer
resource "kubernetes_namespace" "tf-ns-web-layer" {
  provider = kubernetes.provider_alias
  metadata {
    name = "web-layer"
  }
}
