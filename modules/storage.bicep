param storagename string
param location string = 'westus2'

resource storageaccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: storagename
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
  properties: {
    accessTier: 'Hot'
  }
}
