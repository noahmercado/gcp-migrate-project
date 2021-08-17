# Analyze GCP Project Migration
This repository contains utilities for analyzing the migration of projects located in one GCP organization into another.

## Terminology
- Source Organization - Projects, Folders, and resources located in the organization that is being migrated 
- Target Organization - The organization that projects will be migrated in to

## Required Permissions

### Source Organization Permissions
* `cloudasset.assets.analyzeMove`
* `resourcemanager.organizations.getIamPolicy`
* `resourcemanager.folders.getIamPolicy`
* `resourcemanager.projects.getIamPolicy`
* `orgpolicy.policy.get`
* `compute.organizations.setSecurityPolicy`

### Target Organization Permissions
* TBD

## How To
``` shell
# Clone the repository and cd in
git clone https://github.com/noahmercado/gcp-migrate-project
cd gcp-migrate-project

# Log into GCP
gcloud auth login

# Set the required env vars
export DESTINATION_ORG_ID="${ID_OF_DESTINATION_ORG}"
export SOURCE_ORG_ID="${ID_OF_SOURCE_ORG}"

# Run the utility
./analyze_project_move.sh
```