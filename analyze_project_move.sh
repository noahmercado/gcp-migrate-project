#! /usr/bin/env bash

# Apache header:

#     Copyright 2021 Google LLC

#     Licensed under the Apache License, Version 2.0 (the "License");
#     you may not use this file except in compliance with the License.
#     You may obtain a copy of the License at

#         https://www.apache.org/licenses/LICENSE-2.0

#     Unless required by applicable law or agreed to in writing, software
#     distributed under the License is distributed on an "AS IS" BASIS,
#     WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#     See the License for the specific language governing permissions and
#     limitations under the License.


###################################
#
#  HOW TO
#
# #################################

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

##################################################################

# DESTINATION_ORG_ID=""

mkdir -p "migration-to-${DESTINATION_ORG_ID}"

for PROJECT_ID in $(gcloud projects list --format="value(project_id)")
do
    gcloud asset analyze-move --project_id="${PROJECT_ID}" \
        --destination-organization="${DESTINATION_ORG_ID}" \
        > migration-to-${DESTINATION_ORG_ID}/migrate_${PROJECT_ID}_to_${DESTINATION_ORG_ID}_analysis.txt
done

zip -r migration_analysis.zip migration-to-${DESTINATION_ORG_ID}