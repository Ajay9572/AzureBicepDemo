
param pLocation string
param pWebAppName string 
param pAppServicePlanid string
param pAppServiceName string
resource webApplication 'Microsoft.Web/sites@2021-01-15' = {
  name: pWebAppName
  location: pLocation
  tags: {
    'hidden-related:${resourceGroup().id}/providers/Microsoft.Web/serverfarms/${pAppServiceName}': 'Resource'
  }
  properties: {
    serverFarmId: pAppServicePlanid
  }
}

