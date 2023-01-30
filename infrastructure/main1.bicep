
param location string = resourceGroup().location
param project string = 'mdwdo'
param env string = 'dev'
param deployment_id string

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


output datafactory_name string = datafactory.outputs.datafactoryName
output storage_account_name string = storageaccount.outputs.storageName
