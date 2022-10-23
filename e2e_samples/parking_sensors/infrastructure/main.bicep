param project string = 'mdwdo'
param env string = 'dev'
param location string = resourceGroup().location
param deployment_id string


module datafactory './modules/datafactory.bicep' = {
  name: 'datafactory_deploy_${deployment_id}'
  params: {
    project: project
    env: env
    location: location
    deployment_id: deployment_id
  }
}

module storage './modules/storage.bicep' = {
  name: 'storage_deploy_${deployment_id}'
  params: {
    project: project
    env: env
    location: location
    deployment_id: deployment_id
    contributor_principal_id: datafactory.outputs.datafactory_principal_id
  }
}


output storage_account_name string = storage.outputs.storage_account_name
output datafactory_name string = datafactory.outputs.datafactory_name
