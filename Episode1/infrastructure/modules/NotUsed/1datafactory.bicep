param project string
@allowed([
  'dev'
  'prod'
])
param env string
param location string = resourceGroup().location
param deployment_id string

resource datafactory 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: '${project}-adf-${env}-${deployment_id}'
  location: location
  tags: {
    DisplayName: 'Data Factory'
    Environment: env
  }
  identity: {
    type: 'SystemAssigned'
  }
}


output datafactory_principal_id string = datafactory.identity.principalId
output datafactory_name string = datafactory.name
