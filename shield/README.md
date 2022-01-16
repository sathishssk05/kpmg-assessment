# 3-tier App Overview

### Nginx Ingress Controller - Web layer
```
- Nginx Ingress Controller helps to expose the Application in K8S cluster to external world with security features like ssl,proxy,etc.

- The nginx resources will be deployed on GKE Cluster via k8s native Deployment YAML.
```

## Sonarqube Application - App Layer
```
 - SonarQube is an open-source platform which helps for continuous inspection of code quality to perform automatic reviews with static analysis of code to detect bugs, code smells, and security vulnerabilities on 20+ programming languages.
 
 - The sonarqube app is delployed on GKE cluster via k8s native Deployment YAML.
```

## Google cloudsql(Postgres) - DB 
```
- Google Cloud SQL is a fully-managed database service that helps set up and regulate relational databases in GCP.

- The Postgres DB is deployed on Google cloudsql Managed Service via Terraform.
```
