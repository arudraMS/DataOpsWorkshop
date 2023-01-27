---
page_type: sample
languages: Shell Script, Bicep, Yaml, Python, Json
products: Github, Azure Devops, Azure, Azure Data Lake Gen2, Azure Data Factory, Azure Ml Studio
description: "Code samples showcasing how to leverage DataOps for Modern Data Estate"
---

# DataOps to MLOPs

This repository contains code samples and artifacts on how to apply DevOps principles to Infra, Data and Machine Learning pipelines built according to the following diagram. The episodes are focused on end to end data pipeline solution as a reference implementation. Each episode contains code and artifacts relating to setting up

Session 1 (InfraOps):
- Github Infra Pipeline to deploy changes into Azure dev & production environments to build the followong resources
    * In Azure : Resource Groups, Storage Accounts, Data Factories, ML Workspaces
    * In Azure DevOps: Service Connections, Variable Groups, Build Pipeline and Release Pipeline

Session 2 (DataOps & MLOps):
- Building a small data pipeline and ML pipeline
- Triggering ADO Pipelines to deploy changes from ADF Dev to ADF Production Data Pipeline, followed by triggering ADF production pipeline, producing fresh data
- Triggering ADO pipelines to deploy changes from AMLS Dev to Production ML Pipeline, followed by triggering AMLS production pipeline, producing fresh infrence
- Triggering both the above in sequence based on changes in infrastructure, data and ML pipelines

![Architecture](docs/images/DataOpsToMLOps.drawio.png?raw=true "Architecture")


#### Open Accounts in the following portal
- Azure
- Github
- Azure DevOps (ADO)

#### Create a subscription (if you do not have one)
- Login to your subscription and open the cloud shell (if you do not have storage account, it will create the storage)
- Check the following installation by typing az --version, python3 --version, jq --version, az bicep upgrade
- az cli
- Python 3
- jq

#### Install bicep and azure devops for Infra as code and Infraops
- az bicep (If not installed, run az bicep install)
- az extension add --name azure-devops
- code . (if it does not work, install monaco editor by typing npm install monaco-editor@0.34.1)

#### Test the following
- az account show --output table
- az group list --output table
- az group delete 

#### Download the GITHUB repository in your working wolder
- git clone https://github.com/arudraMS/DataOpsWorkshop.git
- chmod -R u+rwx DataOpsWorkshop

#### Go to the DataOps Project folder
- cd DataOpsWorkshop

#### Run the following commands to export environment variables and set the Devops configuration
- export DEPLOYMENT_ID=<>
- export GITHUB_HOME_DIR="/"
- export AZURE_SUBSCRIPTION_ID=$(az account show 2> /dev/null | jq ".id" -r)
- export AZURE_LOCATION=eastus
- export GITHUB_PAT_TOKEN="<>"
- export GITHUB_REPO=arudraMS/DataOpsWorkshop
- export AZURE_DEVOPS_EXT_PAT="<>"
- export AZDO_ORGANIZATION_URL="https://dev.azure.com/<>/"
- export AZDO_PROJECT=DataOpsWorkShop
- export AZDO_PIPELINES_BRANCH_NAME=main
- az devops configure --defaults organization="$AZDO_ORGANIZATION_URL" project="$AZDO_PROJECT"

#### Execute the following script	
- ./scripts/clean_up.sh
- ./deploy.sh
--------------------------------------------------------------------------------------------******************----------------------------------------------
