---
page_type: sample
languages: Shell Script, Bicep, Yaml, Python, Json
products: Github, Azure Devops, Azure, Azure Data Lake Gen2, Azure Data Factory, Azure Ml Studio
description: "Code samples showcasing how to leverage DataOps for Modern Data Estate"
---

# DataOps to MLOPs

This repository contains code samples and artifacts on how to apply DevOps principles to Infra, Data and Machine Learning pipelines built according to the following diagram. The episodes are focused on end to end data pipeline solution as a reference implementation. Each episode contains code and artifacts relating to setting up

Episode 1 (DataOps):
- Github Infrastructure Pipeline to deploy changes into Azure dev & production environments
- Azure DevOps (ADO) Build and Release Pipelines to deploy changes in Azure Data Factory Dev and Production Data Pipeline
- Automated Invocation of Production Data Pipeline based on any changes in Infrastructure and Data Pipeline

Episode2 (MLOps):
- Azure DevOps (ADO) Build and Release Pipelines to deploy changes in Azure ML Studio Dev and Production Pipeline
- Automated Invocation of Production ML Pipelines based on any changes in Infrastructure Pipeline, Data Pipeline and ML Pipeline

![Architecture](docs/images/DataOpsWorkShop-Episode4.png?raw=true "Architecture")

- **Parking Sensor Solution** - This demonstrates batch, end-to-end data pipeline following the MDW architecture, along with a corresponding CI/CD process.
- [Episode 1:](./Episode1/) Integrating Infra, Data Factory with Github & Azure DevOps (ADO)
- [Episode 2:](./Episode2/) Integrating Infra, Data Factory, ML Studio with Github & ADO
