param location string
param storageName string
@allowed([
  'Standard_LRS'
  'Standard_ZRS'
  'Standard_GRS'
  'Standard_GZRS'
  'Standard_RAGRS'
  'Standard_RAGZRS'
  'Premium_LRS'
  'Premium_ZRS'
])
param storageSkuName string = 'Standard_LRS'
param contributorPrincipalId string


var storageBlobDataContributor = subscriptionResourceId('Microsoft.Authorization/roleDefinitions', 'ba92f5b4-2d11-453d-a403-e96b0029c9fe') 
//ba92f5b4-2d11-453d-a403-e96b0029c9fe is the id of storage_blob_data_contributor

resource storage 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: storageName
  location: location
  sku: {
    name: storageSkuName
  }
  kind: 'StorageV2'
  properties: {
    isHnsEnabled: true
    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'Allow'
    }
    supportsHttpsTrafficOnly: true
    encryption: {
      services: {
        file: {
          enabled: true
        }
        blob: {
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
    accessTier: 'Hot'
  }
}

resource storage_roleassignment 'Microsoft.Authorization/roleAssignments@2020-08-01-preview' = {
  name: guid(storage.id)
  scope: storage
  properties: {
    roleDefinitionId: storageBlobDataContributor
    principalId: contributorPrincipalId
    principalType: 'ServicePrincipal'
  }
}

output storageId string = storage.id
output storageName string = storage.name

