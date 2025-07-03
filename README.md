#  Azure PostgreSQL Flexible Server Deployment with Terraform

This repository contains Terraform code to provision an **Azure Database for PostgreSQL - Flexible Server**, following real-world best practices:

- Remote backend via Azure Storage Account
- GitHub Actions-based CI/CD
- Parameterized deployment with `.tfvars`
- Secure, modular, and production-ready

---

##  Project Structure
 
```

AZURE-DB-PSQL-Server/

├── main.tf                # Defines the Azure Database for PostgreSQL - Flexible Server resource

├── provider.tf            # AWS provider configuration

├── variables.tf           # Input variables 

├── terraform.tfvars       # Variable values for deployment

├── outputs.tf             # Output values 

├── backend.tf             # Stores Terraform state in S3

└── .github/

    └── workflows/

        └── deploy.yml  # GitHub Actions automation workflow

```
 
---
 
---

##  Required Secrets in GitHub

In your GitHub repo, go to **Settings → Secrets and Variables → Actions** and add:

AZURE_CREDENTIALS  and the value is in the json format
```
{
  "clientId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "clientSecret": "your-very-secure-client-secret",
  "tenantId": "yyyyyyyy-yyyy-yyyy-yyyy-yyyyyyyyyyyy",
  "subscriptionId": "zzzzzzzz-zzzz-zzzz-zzzz-zzzzzzzzzzzz"
}
```

These are required for the GitHub Actions workflow to authenticate with Azure.
How you get these : in shell run the command :

```
# az ad sp create-for-rbac --name "<App registration name(Service Principal)>" --role Contributor --scopes /subscriptions/$(az account show --query id -o tsv) --sdk-auth

```

---

##  GitHub Actions CI/CD

The included workflow (`.github/workflows/deploy.yml`) automatically runs:

- On every push to the `main` branch 

Steps:
1. Checkout code
2. Set up Terraform
3. Run `terraform init`, `validate`, `plan`, and `apply`

---

## Outputs
Terraform will return:

postgresql_fqdn – FQDN of the database server

##  Security Notes
Passwords: Should ideally come from GitHub Secrets .

Non-SSL Port: Is disabled by default — use SSL for all connections.

VNet Integration: For production, use a delegated subnet and private DNS zone.

##  Cleanup
```
terminal
terraform init
terraform destroy 
```
## References
Terraform PostgreSQL Flexible Server Docs

https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server

