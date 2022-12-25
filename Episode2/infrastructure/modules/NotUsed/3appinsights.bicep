param project string
param env string
param location string = resourceGroup().location
param deployment_id string

resource appinsights 'Microsoft.Insights/components@2020-02-02-preview' = {
  name: '${project}-appi-${env}-${deployment_id}'
  location: location
  tags: {
    DisplayName: 'Application Insights'
    Environment: env
  }
  kind: 'web'
  properties: {
    Application_Type: 'other'
  }
}

output appinsights_id string = appinsights.id
output appinsights_name string = appinsights.name


