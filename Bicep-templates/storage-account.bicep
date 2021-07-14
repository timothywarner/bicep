param stgPrefix string = 'twprojectx1'
param ownerTagName string = 'Tim Warner'

@allowed([
  'Standard_LRS'
  'Standard_ZRS'
  'Standard_RAGRS'
])
param replicationOption string = 'Standard_LRS'

var uniqueStorageName_var = '${stgPrefix}stg21'

resource uniqueStorageName 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: uniqueStorageName_var
  tags: {
    owner: ownerTagName
  }
  location: resourceGroup().location
  kind: 'StorageV2'
  sku: {
    name: replicationOption
    tier: 'Standard'
  }
}

output storageEndpoint object = uniqueStorageName.properties.primaryEndpoints
