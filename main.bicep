param plocation string
param pAppserviceName string
param pSKUName string
param pCapacity int
param pWebAppName string
param pStorageName string

module AppServicePlanCreate 'module/azAppServicePlanCreate.bicep'={
  name:'AppServicePlan'
  params:{
    pAppserviceName:pAppserviceName
    pCapacity:pCapacity
    plocation:plocation
    pSKUName:pSKUName
  }
}

module WebAppCreate 'module/azWebAppCreate.bicep'={
  name:'WebApplication'
  params:{
    pAppServiceName:pAppserviceName
    pAppServicePlanid:AppServicePlanCreate.outputs.oAppServiceId
    pLocation:plocation
    pWebAppName:pWebAppName
  }
}

module StorageAccountCreate 'module/azStorageAccountCreate.bicep' ={
  name:'StorageAccount'
  params:{
    pLocation:plocation
    pStorageName:pStorageName
  }
}
