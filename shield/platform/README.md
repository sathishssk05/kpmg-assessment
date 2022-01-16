### GKE cluster with nodepool & Postgresql Deployment

# Prerequesties
```
  - gcloud (Authenticated)
  - Required IAM Permissions
  - Terraform
  - Gcloud & Terraform auth integration
```

# K8S Cluster & Postgres Deploy

 - Run the below commands to deploy gke cluster with separate managed nodepool & Postgresql 

 ```bash
   terraform init  # Helps to install the needful plugins to spin-up the resources
```

```bash
   terraform plan  # Display the detailed plan & resources information to get more visibility of the deployment
```

 - If the Terraform Plan is looks good, then proceed with the Actual resource deployment on Google Cloud by run the below command.

 ```bash
   terraform apply  # Create's the resources defined on the specific terraform folder.
```

# To destroy the resources

  - Perform the below command to delete the resources which are created through terraform.

 ```bash
    terraform destroy
```