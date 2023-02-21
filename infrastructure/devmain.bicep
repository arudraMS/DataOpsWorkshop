@description('Conditional resource creation')
param deployStorage bool
param deployADF bool
param deployEventHub bool

@description('Key Vault Name')
param keyVaultName string

@description('Data Factory Name')
param dataFactoryName string

@description('Storage SKU')
param storageSKU string

@description('Location of the data factory.')
param location string = resourceGroup().location

@description('Name of the Azure storage account that contains the input/output data.')
param storageAccountName string

@description('Name of the blob container in the Azure Storage account.')
param blobContainerName string = 'blob${uniqueString(resourceGroup().id)}'

@description('Specifies a project name that is used to generate the Event Hub name and the Namespace name.')
param projectName string

@description('Specifies the messaging tier for Event Hub Namespace.')
@allowed([
  'Basic'
  'Standard'
])
param eventHubSku string = 'Standard'

@description('Name of the Git Account.')
param gitAccountName string

@description('Name of the Git Repository.')
param gitRepoName string

@description('Name of the Git Collaboration Branch.')
param gitCollabBranch string

@description('Name of the Git Root Folder.')
param gitRootFolder string

@description('Git Type.')
param gitType string

var eventHubNamespaceName = '${projectName}ns'
var eventHubName = projectName

resource keyVault 'Microsoft.KeyVault/vaults@2021-10-01' = {
  name: keyVaultName
  location: location
  properties: {
    createMode: 'default'
    enabledForDeployment: false
    enabledForDiskEncryption: false
    enabledForTemplateDeployment: false
//  enableSoftDelete: true
    enableRbacAuthorization: true
//  enablePurgeProtection: true
    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'Deny'
    }
    sku: {
      family: 'A'
      name: 'standard'
    }
    softDeleteRetentionInDays: 7
    tenantId: subscription().tenantId
  }
}

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-08-01' = if (deployStorage) {
  name: storageAccountName
  location: location
  sku: {
    name: storageSKU
  }
  kind: 'StorageV2'
}

resource blobContainer 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-08-01' = if (deployStorage) {
  name: '${storageAccount.name}/default/${blobContainerName}'
}

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' = if (deployADF) {
  name: dataFactoryName
  location: location
  properties: {
    repoConfiguration: {
      accountName: gitAccountName
      repositoryName: gitRepoName
      collaborationBranch: gitCollabBranch
      rootFolder: gitRootFolder
      type: gitType
    }
   }
  identity: {
    type: 'SystemAssigned'
  }
}


resource eventHubNamespace 'Microsoft.EventHub/namespaces@2021-11-01'  = if (deployEventHub) {
  name: eventHubNamespaceName
  location: location
  sku: {
    name: eventHubSku
    tier: eventHubSku
    capacity: 1
  }
  properties: {
    isAutoInflateEnabled: false
    maximumThroughputUnits: 0
  }
}

resource eventHub 'Microsoft.EventHub/namespaces/eventhubs@2021-11-01' = if (deployEventHub)  {
  parent: eventHubNamespace
  name: eventHubName
  properties: {
    messageRetentionInDays: 7
    partitionCount: 1
  }
}
