param location string = 'westus2'
param storagename string = 'spacetestapp02109'
param nameprefix string ='paulon'
targetScope = 'resourceGroup'

param dockerimage string = 'nginxdemos/hello'
param dockerimagetag string = 'latest'
// how to consume modules

module storage 'modules/storage.bicep' = {
  name: '${nameprefix}-storagedeploy'
  params: {
    storagename: storagename 
    location:location
  }

}

module appplandeploy 'modules/serviceplan.bicep' = {
  name: '${nameprefix}-deploy-serviceplan'
  params: {
    nameprefix: nameprefix
    location: location
    
  }
}

module webapplication 'modules/webapp.bicep' = {
  name: '${nameprefix}-deploy-website'
  params: {
    location: location
    appplanid: appplandeploy.outputs.planid
    dockerimage: dockerimage
    dockerimagetag: dockerimagetag
  }
}

output siteurl string = webapplication.outputs.siteurl
