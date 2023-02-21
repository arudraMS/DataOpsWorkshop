
param location string = resourceGroup().location
param project string = 'mdwdo'
param env string = 'dev'
param deployment_id string
param amlComputeDefaultVmSize string = 'Standard_DS1_v2'

module datafactory './modules/datafactory.bicep' = {
  name: '${project}-adf-${env}-${deployment_id}-deployment'
  params: {
    datafactoryName:'${project}-adf-${env}-${deployment_id}'
    location: location
  }
}

module storageaccount './modules/storage.bicep' = {
  name: '${project}st${env}${deployment_id}-deployment'
  params: {
    storageName:'${project}st${env}${deployment_id}'
    location: location
    contributorPrincipalId: datafactory.outputs.datafactoryPrincipalId
  }
}


module keyvault 'modules/keyvault.bicep' = {
  name: '${project}kv${env}${deployment_id}-deployment'
  params: {
    location: location
    keyvaultName:'${project}kv${env}${deployment_id}'
  }
}

module mlstorage 'modules/mlstorage.bicep' = {
  name: '${project}mlst${env}${deployment_id}-deployment'
  params: {
    location: location
    mlstorageName: '${project}mlst${env}${deployment_id}'
    mlstorageSkuName: 'Standard_LRS'
  }
}

module containerRegistry 'modules/containerregistry.bicep' = {
  name: '${project}cr${env}${deployment_id}-deployment'
  params: {
    location: location
    containerRegistryName: '${project}cr${env}${deployment_id}'
  }
}

module applicationInsights 'modules/applicationinsights.bicep' = {
  name: '${project}-appi-${env}-${deployment_id}-deployment'
  params: {
    location: location
    applicationInsightsName: '${project}-appi-${env}-${deployment_id}'
  }
}

module azuremlWorkspace 'modules/machinelearning.bicep' = {
  name: '${project}aml${env}${deployment_id}-deployment'
  params: {
    location: location
    machineLearningName: '${project}aml${env}${deployment_id}'
    machineLearningFriendlyName: 'Private link endpoint sample workspace'
    machineLearningDescription: 'This is an example workspace having a private link endpoint.'
    applicationInsightsId: applicationInsights.outputs.applicationInsightsId
    containerRegistryId: containerRegistry.outputs.containerRegistryId
    keyVaultId: keyvault.outputs.keyvaultId
    mlstorageAccountId: mlstorage.outputs.mlstorageId
    mlcomputeInstanceName:'${project}ci${env}${deployment_id}'
    vmSizeParam: amlComputeDefaultVmSize

  }
  dependsOn: [
    keyvault
    containerRegistry
    applicationInsights
    mlstorage
  ]
}

output datafactory_name string = datafactory.outputs.datafactoryName
output storage_account_name string = storageaccount.outputs.storageName
output keyvault_name string = keyvault.outputs.keyvaultName
output appinsights_name string = applicationInsights.outputs.applicationInsightsName
output containerregistry_name string = containerRegistry.outputs.containerRegistryName
output machinelearning_name string = azuremlWorkspace.outputs.machineLearningName
