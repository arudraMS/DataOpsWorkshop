param location string = resourceGroup().location
param datafactoryName string

resource datafactory 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: datafactoryName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
}

output datafactoryId string = datafactory.id
output datafactoryName string = datafactory.name
output datafactoryPrincipalId string = datafactory.identity.principalId