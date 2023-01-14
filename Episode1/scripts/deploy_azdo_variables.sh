
#!/bin/bash

# Access granted under MIT Open Source License: https://en.wikipedia.org/wiki/MIT_License
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
# documentation files (the "Software"), to deal in the Software without restriction, including without limitation 
# the rights to use, copy, modify, merge, publish, distribute, sublicense, # and/or sell copies of the Software, 
# and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all copies or substantial portions 
# of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
# TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
# CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
# DEALINGS IN THE SOFTWARE.


#######################################################
# Deploys Azure DevOps Variable Groups
#
# Prerequisites:
# - User is logged in to the azure cli
# - Correct Azure subscription is selected
# - Correct Azure DevOps Project selected
#######################################################

set -o errexit
set -o pipefail
set -o nounset
set -o xtrace # For debugging

###################
# REQUIRED ENV VARIABLES:
#
# PROJECT
# ENV_NAME
# AZURE_SUBSCRIPTION_ID
# AZURE_LOCATION
# RESOURCE_GROUP_NAME
# KV_URL
# DATABRICKS_HOST
# DATABRICKS_TOKEN
# DATABRICKS_WORKSPACE_RESOURCE_ID
# SQL_SERVER_NAME
# SQL_SERVER_USERNAME
# SQL_SERVER_PASSWORD
# SQL_DW_DATABASE_NAME
# AZURE_STORAGE_ACCOUNT
# AZURE_STORAGE_KEY
# DATAFACTORY_NAME
# SP_ADF_ID
# SP_ADF_PASS
# SP_ADF_TENANT


# Const
apiBaseUrl="https://data.melbourne.vic.gov.au/resource/"

# Create vargroup
vargroup_name="${PROJECT}-${DEPLOYMENT_ID}-${ENV_NAME}-release"
if vargroup_id=$(az pipelines variable-group list -o tsv | grep "$vargroup_name" | awk '{print $3}'); then
    echo "Variable group: $vargroup_name already exists. Deleting..."
    az pipelines variable-group delete --id "$vargroup_id" -y
fi
echo "Creating variable group: $vargroup_name"
az pipelines variable-group create \
    --name "$vargroup_name" \
    --authorize "true" \
    --variables \
        azureLocation="$AZURE_LOCATION" \
        rgName="$RESOURCE_GROUP_NAME" \
        adfName="$DATAFACTORY_NAME" \
        apiBaseUrl="$apiBaseUrl" \
    --output json
