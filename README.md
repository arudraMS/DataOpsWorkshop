---
page_type: sample
languages: Shell Script, Bicep, Yaml, Python, Json
products: Github, Azure Devops, Azure, Azure Data Lake Gen2, Azure Data Factory, Azure Ml Studio
description: "Code samples showcasing how to leverage DataOps for Modern Data Estate"
---

# DataOps to MLOPs

This repository contains code samples and artifacts on how to apply DevOps principles to Infra, Data and Machine Learning pipelines built according to the following diagram. The episodes are focused on end to end data pipeline solution as a reference implementation. Each episode contains code and artifacts relating to setting up

Episode 1 (InfraOps):
- Github Pipeline to deploy changes into Azure dev & production environments to build the followong resources
    * In Azure : Resource Groups, Storage Accounts, Data Factories, ML Workspaces
    * In Azure DevOps: Service Connections, Variable Groups, Build Pipeline and Release Pipeline

Episode2 (DataOps & MLOps):
- Building a small data pipeline and ML pipeline
- Triggering ADO Pipelines to deploy changes from ADF Dev to ADF Production Data Pipeline, followed by triggering ADF production pipeline, producing fresh data
- Triggering ADO pipelines to deploy changes from AMLS Dev to Production ML Pipeline, followed by triggering AMLS production pipeline, producing fresh infrence
- Triggering both the above in sequence based on changes in infrastructure, data and ML pipelines

![Architecture](docs/images/DataOpsWorkShop-Episode4.png?raw=true "Architecture")

- **Parking Sensor Solution** - This demonstrates batch, end-to-end data pipeline following the MDW architecture, along with a corresponding CI/CD process.
- [Episode 1:](./Episode1/) Integrating Infra, Data Factory with Github & Azure DevOps (ADO)
- [Episode 2:](./Episode2/) Integrating Infra, Data Factory, ML Studio with Github & ADO
