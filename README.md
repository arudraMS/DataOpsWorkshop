---
page_type: sample
languages: Shell Script, bicep, Yaml 
products: github, azure devops, azure, azure-data-lake-gen2, azure-data-factory, azure-ml-studio, azure-databricks, azure-synapse, azure-sql
description: "Code samples showcasing how to leverage DataOps for Modern Data Estate"
---

# DataOps for the Modern Data Estate

This repository contains code samples and artifacts on how to apply DevOps principles to Infra, Data and Machine Learning pipelines built according to the following diagram. The episodes are focused on end to end data pipeline solution as a reference implementation. Each episode contains code and artifacts relating to setting up

- Initial Infrastructure Pipeline as Code (IaC) and deploying changes of Infrastructure using Azure CloudShell & Github
- Build and Release Pipelines (CICD) using Azure DevOps to deploy ongoing changes in Data and Machine Learning Pipleines from Dev to Higher Environments 
- Automated Invocation of Data & Machine Learning Pipelines 

![Architecture](docs/images/DataOpsWorkShop-Episode4.png?raw=true "Architecture")

- **Parking Sensor Solution** - This demonstrates batch, end-to-end data pipeline following the MDW architecture, along with a corresponding CI/CD process.
- [Episode 1:](./Episode1/) Integrating Infra, Data Factory with Github & Azure DevOps (ADO)
- [Episode 2:](./Episode2/) Integrating Infra, Data Factory, ML Studio with Github & ADO
- [Episode 3:](./Episode3/) Integrating Infra, Data Factory, ML Studio, Azure Data Bricks with Github & ADO
- [Episode 4:](./Episode4/) Integrating Infra, Data Factory, ML Studio, Data Bricks, Synapse, Keyvault with Github & ADO
