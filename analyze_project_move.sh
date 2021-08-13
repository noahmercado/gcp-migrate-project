#! /usr/bin/env bash

# Log in to Organization to migrate (console and CLI)
#    gcloud auth login

# Enable Cloud Asset API
# Assign Viewer role to user in project / organization being moved
# Need resourcemanager.organizations.getIamPolicy on project being moved's org
# Need resourcemanager.folders.getIamPolicy on project being moved's folder
# Need resourcemanager.projects.getIamPolicy on the project being moved
# Need orgpolicy.policy.get on project being moved
# Need compute.organizations.setSecurityPolicy on project being moved folder or org
# export DESTINATION_ORG_ID=<DESTINATION_ID>

DESTINATION_ORG_ID=""

for PROJECT_ID in $(gcloud projects list --format="value(project_number)")
do
    gcloud asset analyze-move --project="${PROJECT_ID}" \
        --destination-organization="${DESTINATION_ORG_ID}" \
        > migrate_${PROJECT_ID}_to_${DESTINATION_ORG_ID}_analysis.txt
done
