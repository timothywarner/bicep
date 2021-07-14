@minLength(3)
@maxLength(11)
param namePrefix string
param location string = resourceGroup().location

module stgModule './module.bicep' = {
  name: 'storageDeploy'
  params: {
    storagePrefix: namePrefix
    location: location
  }
}

output storageEndpoint object = stgModule.outputs.storageEndpoint
