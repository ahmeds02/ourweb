param location string = 'westus2'
param nameprefix string = 'paulon0210'
param appplanid string

param dockerimage string = 'nginxdemos/hello'
param dockerimagetag string = 'latest'

resource webApplication 'Microsoft.Web/sites@2024-04-01' = {
  name: '${nameprefix}-site'
  location: location
  
  properties: {
    serverFarmId: appplanid
    //httpsOnly: true
    siteConfig: {appSettings: [
      {
        name: 'DOCKER_REGISTRY_SERVICE_URL'
        value: 'https://index.docker.io'
    }
    {
      name: 'DOCKER_REGISTRY_SERVER_USERNAME'
      value: ''
  }
  {
        name: 'DOCKER_REGISTRY_SERVER_PASSWORD'
        value: ''
    }
    ]
    linuxFxVersion: 'DOCKER|${dockerimage}:${dockerimagetag}'
  }
  }
}
output siteurl string = webApplication.properties.hostNames[0]
