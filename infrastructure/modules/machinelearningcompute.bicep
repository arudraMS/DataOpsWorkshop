param location string
param machineLearningComputeInstanceName string
param vmSizeParam string

resource machineLearningComputeInstance001 'Microsoft.MachineLearningServices/workspaces/computes@2022-05-01' = {
  name: machineLearningComputeInstanceName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    computeType: 'ComputeInstance'
    computeLocation: location
    description: 'Machine Learning compute instance 001'
    disableLocalAuth: true
    properties: {
      applicationSharingPolicy: 'Personal'
      computeInstanceAuthorizationType: 'personal'
      sshSettings: {
        sshPublicAccess: 'Disabled'
      }
      vmSize: vmSizeParam
    }
  }
}

