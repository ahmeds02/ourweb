param nameprefix string 
param location string = resourceGroup().location
param sku string = 'B1'
param kind string = 'ubuntu'
resource appserviceplan 'Microsoft.Web/serverfarms@2024-04-01' = {
  name: '${nameprefix}-website'
  location: location
  kind: kind
  sku: {
    name:sku
  }
properties: {
  reserved: true
}
}
// output --> is the input from other services
output planid string = appserviceplan.id
