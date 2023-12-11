
param pLocation string
param pStorageName string
resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: pStorageName
  location: pLocation
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
}

