param location string
param machineLearningName string
param machineLearningFriendlyName string = machineLearningName
param machineLearningDescription string
param applicationInsightsId string
param containerRegistryId string
param keyVaultId string
param mlstorageAccountId string
param mlcomputeInstanceName string
param vmSizeParam string
 
resource machineLearning 'Microsoft.MachineLearningServices/workspaces@2022-05-01' = {
  name: machineLearningName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    friendlyName: machineLearningFriendlyName
    description: machineLearningDescription
    applicationInsights: applicationInsightsId
    containerRegistry: containerRegistryId
    keyVault: keyVaultId
    storageAccount: mlstorageAccountId
  }
}

module machineLearningCompute 'machinelearningcompute.bicep' = {
  name: 'machineLearningComputes'
  scope: resourceGroup()
  params: {
    machineLearningComputeInstanceName: '${machineLearningName}/${mlcomputeInstanceName}'
    location: location
    vmSizeParam: vmSizeParam
  }
  dependsOn: [
    machineLearning
  ]
}

output machineLearningId string = machineLearning.id
output machineLearningName string = machineLearning.name
