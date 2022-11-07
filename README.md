---
page_type: sample
languages: Shell Script, bicep, Yaml 
products: github, azure devops, azure, azure-data-lake-gen2, azure-data-factory, azure-ml-studio, azure-databricks, azure-synapse, azure-sql
description: "Code samples showcasing how to leverage DataOps for Modern Data Estate"
---

# DataOps for the Modern Data Estate

This repository contains code samples and artifacts on how to apply DevOps principles to data pipelines built according to the [Modern Data Warehouse (MDW)](https://azure.microsoft.com/en-au/solutions/architecture/modern-data-warehouse/) architectural pattern on [Microsoft Azure](https://azure.microsoft.com/en-au/).

The episodes are focused on end to end data pipeline solution as a reference implementation. Each episode contains code and artifacts relating to setting up

- Initial Infrastructure Pipeline as Code (IaC) and deploying changes of Infrastructure using Azure CloudShell & Github
- Build and Release Pipelines (CICD) using Azure DevOps to deploy ongoing changes in Data and Machine Learning Pipleines from Dev to Higher Environments 
- Automated Invocation of Data & Machine Learning Pipelines 

## End to End samples
- **Parking Sensor Solution** - This demonstrates batch, end-to-end data pipeline following the MDW architecture, along with a corresponding CI/CD process.

![Architecture](docs/images/DataOpsWorkShop-Episode4.png?raw=true "Architecture")
