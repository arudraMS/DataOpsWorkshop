param project string
param env string
param location string = resourceGroup().location
param deployment_id string

param mlworkspace string

resource mlcomp 'Microsoft.MachineLearningServices/workspaces/computes@2020-08-01' = {
  name: '${mlworkspace}/${project}mlcomp${env}${deployment_id}-ci'
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

output mlcomp_id string = mlcomp.id
output mlcomp_name string = mlcomp.name
