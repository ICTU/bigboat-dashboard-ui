module.exports =
  saveAppRequest: (app, dockerCompose, bigboatCompose) ->
    type: 'SAVE_APP_REQUEST'
    app: app
    dockerCompose: dockerCompose
    bigboatCompose: bigboatCompose
  startAppRequest: (appName, version, instanceName) ->
    type: 'START_APP_REQUEST'
    app:
      name: appName
      version: version
    instanceName: instanceName
  removeAppRequest: (app) ->
    type: 'REMOVE_APP_REQUEST'
    app: app
  startAppFormRequest: (app) ->
    type: 'START_APP_FORM_REQUEST'
    app: app
  appSelected: (name, version) ->
    type: 'APP_SELECTED'
    value:
      name: name
      version: version
