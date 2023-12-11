
param plocation string 
@minLength(3)
@maxLength(34)
param pAppserviceName string 
@allowed(['F1'])
param pSKUName string 
@allowed([1])
@maxValue(34)
@minValue(1)
@description('''Please Provide Capacity
For Example:
1
2
3
4''')
param pCapacity int

resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: pAppserviceName
  location: plocation
  sku: {
    name: pSKUName
    capacity: pCapacity
  }
}

output oAppServiceId string = appServicePlan.id

