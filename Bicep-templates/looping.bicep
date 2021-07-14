/*
In this example, we loop over the storageAccounts array. For each loop iteration, storageName is set to the current array item and is referenced by name in the loop body.
*/

resource storageAccountResources 'Microsoft.Storage/storageAccounts@2019-06-01' = [for i in range(0,3): {
  name: 'storageName${i}'
  location: resourceGroup().location
  properties: {
    supportsHttpsTrafficOnly: true
    accessTier: 'Hot'
    encryption: {
      keySource: 'Microsoft.Storage'
      services: {
        blob: {
          enabled: true
        }
        file: {
          enabled: true
        }
      }
    }
  }
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}]
