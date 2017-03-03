_           = require 'lodash'
{ connect } = require 'react-redux'
{saveAppRequest, removeAppRequest, startAppRequest} = require '/imports/redux/actions/apps.coffee'

mapStateToProps = (state, { params }) ->
  app = _.find state.collections.apps, {name: params.name, version: params.version}
  app: app
  title: "#{app?.name}:#{app?.version}"
  dockerCompose: app?.dockerCompose
  bigboatCompose: app?.bigboatCompose
  isLoading: not app?

mapDispatchToProps = (dispatch) ->
  onSaveApp: (app, dockerCompose, bigboatCompose)->
    dispatch saveAppRequest app, dockerCompose, bigboatCompose
  onRemoveApp: (app) -> dispatch removeAppRequest app
  onStartApp: (app) -> dispatch startAppRequest app


mergeProps = (stateProps, dispatchProps, ownProps) ->
  app = stateProps.app
  Object.assign {}, stateProps, dispatchProps, ownProps,
    onSaveApp: (dockerCompose, bigboatCompose)->
      dispatchProps.onSaveApp app, (dockerCompose or app.dockerCompose), (bigboatCompose or app.bigboatCompose)
    onRemoveApp: -> dispatchProps.onRemoveApp app
    onStartApp: -> dispatchProps.onStartApp app

module.exports = connect(mapStateToProps, mapDispatchToProps, mergeProps) require '../AppsDetailPage.cjsx'

# { createContainer } = require 'meteor/react-meteor-data'
#
#
# module.exports = createContainer (props) ->
#   App = props.route.App
#   Apps = App.collections.Apps
#
#   App.subscribe.allApps()
#
#   name = props.params.name
#   version = props.params.version
#
#   app = Apps.findOne name: name, version: version
#
#   title: "#{name}:#{version}"
#   dockerCompose: app?.dockerCompose
#   bigboatCompose: app?.bigboatCompose
#   onSaveApp: (dockerCompose, bigboatCompose)->
#     App.emit 'save app', app, (dockerCompose or app.dockerCompose), (bigboatCompose or app.bigboatCompose)
#   onRemoveApp: -> App.emit 'remove app', app
#   onStartApp: -> App.emit 'start app', app
#
# , require '../AppsDetailPage.cjsx'
