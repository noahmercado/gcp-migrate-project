# Analyze GCP Project Migration

This repository contains a template that can be used to seed a repository for a
new Google open source project.

See [go/releasing](http://go/releasing) (available externally at
https://opensource.google/docs/releasing/) for more information about
releasing a new Google open source project.

This template uses the Apache license, as is Google's default.  See the
documentation for instructions on using alternate license.

# How To
``` shell
git clone https://github.com/noahmercado/gcp-migrate-project
cd gcp-migrate-project
gcloud auth login
# Enable Cloud Asset API
# Assign Viewer role to user in project / organization being moved
# Need resourcemanager.organizations.getIamPolicy on project being moved's org
# Need resourcemanager.folders.getIamPolicy on project being moved's folder
# Need resourcemanager.projects.getIamPolicy on the project being moved
# Need orgpolicy.policy.get on project being moved
# Need compute.organizations.setSecurityPolicy on project being moved folder or org
export DESTINATION_ORG_ID="${ID_OF_DESTINATION_ORG}"
./analyze_project_move.sh
```