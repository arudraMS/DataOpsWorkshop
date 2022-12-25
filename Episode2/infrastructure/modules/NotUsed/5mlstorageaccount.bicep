param project string
param env string
param location string = resourceGroup().location
param deployment_id string

var StorageMLAccountName ='${project}mlst${env}${deployment_id}'
var StorageMLAccountContainerName = 'datalake'

resource mlstorageaccount 'Microsoft.Storage/storageAccounts@2021-01-01' = {
  name: StorageMLAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    encryption: {
      services: {
        blob: {
          enabled: true
        }
        file: {
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
    supportsHttpsTrafficOnly: true
  }
}

resource storagemlcntr 'Microsoft.Storage/storageAccounts/blobServices/containers@2019-06-01' = {
  name: '${StorageMLAccountName}/default/${StorageMLAccountContainerName}'
  dependsOn: [
    mlstorageaccount
  ]
}

output mlstorageaccount_id string = mlstorageaccount.id
output mlstorageaccount_name string = mlstorageaccount.name

