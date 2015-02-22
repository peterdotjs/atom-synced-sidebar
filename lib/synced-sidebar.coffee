{CompositeDisposable} = require 'atom'

module.exports = SynchedSidebar =
  subscriptions: null

  activate: (state) ->
    #check if subscriptions already exist
    if @subscriptions
      return

    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.workspace.onDidChangeActivePaneItem => @revealActiveFile()

  deactivate: ->
    @subscriptions.dispose()

  revealActiveFile: ->
    treeView = atom.views.getView(atom.workspace).querySelector('.tree-view')

    #check if panel is open
    if treeView
      atom.commands.dispatch(atom.views.getView(atom.workspace), 'tree-view:reveal-active-file')
