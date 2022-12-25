param project string
param env string
param location string = resourceGroup().location
param deployment_id string

//param storageaccountid string
//param applicationinsightsid string
//param containerregistryid string

var AppInsightName = '${project}appi${env}${deployment_id}'
var StorageMLAccountName ='${project}mlst${env}${deployment_id}'
var StorageMLAccountContainerName = 'datalake'
var AzureMLName = '${project}aml${env}${deployment_id}' //'${project}aml${env}${deployment_id}'
var CompMlName = '${AzureMLName}/${deployment_id}-ci001'
var ContainerRegistryName = '${project}cr${env}${deployment_id}'

resource storageml 'Microsoft.Storage/storageAccounts@2021-01-01' = {
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
    storageml
  ]
}

resource applins 'Microsoft.Insights/components@2018-05-01-preview' = {
  name: AppInsightName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
  }
}


resource containerregistry 'Microsoft.ContainerRegistry/registries@2021-12-01-preview' = {
  name: ContainerRegistryName
  location: location
  sku: {
    name: 'Standard'
  }
  properties: {
    adminUserEnabled: true
  }
}

resource azureml 'Microsoft.MachineLearningServices/workspaces@2021-07-01' = {
  identity: {
    type: 'SystemAssigned'
  }
  name: AzureMLName
  location: location
  tags: {
    DisplayName: 'Azure ML Studio workspace'
    Environment: env
  }
  properties: {
//    friendlyName:'atnazureml'
    storageAccount: storageml.id
    applicationInsights: applins.id

  }
}

resource compml 'Microsoft.MachineLearningServices/workspaces/computes@2020-08-01' = {
  name: CompMlName
  location: location
  properties: {
    computeType: 'ComputeInstance'
    computeLocation: location
    description: 'Machine Learning Compute Instance 01'
      properties: {
        applicationSharingPolicy: 'Personal'
        computeInstanceAuthorizationType: 'personal'
        sshSettings: {
          sshPublicAccess: 'Disabled'
        }
        vmSize: 'Standard_DS12_v2'
      } 
  }
}


//output mlworkspace_id string = mlworkspace.id
output azureml_name string  = azureml.name
//output mlworkspace_principal_id string = mlworkspace.identity.principalId
