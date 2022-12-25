param project string
param env string
param location string = resourceGroup().location
param deployment_id string

resource containerregistry 'Microsoft.ContainerRegistry/registries@2021-12-01-preview' = {
  name: '${project}cr${env}${deployment_id}'
  location: location
  sku: {
    name: 'Standard'
  }
  properties: {
    adminUserEnabled: true
  }
}

output containerregistry_id string = containerregistry.id
output containerregistry_name string = containerregistry.name
