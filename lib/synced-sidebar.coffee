{CompositeDisposable} = require 'atom'

module.exports = SyncedSidebar =
  subscriptions: null

  activate: (state) ->
    #check if subscriptions already exist
    if @subscriptions
      return

    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.workspace.onDidChangeActivePaneItem => @revealActiveFile()

    atom.commands.add 'body', 'pane:show-previous-item': ->
      atom.views.getView(atom.workspace).focus()

    atom.commands.add 'body', 'pane:show-next-item': ->
      atom.views.getView(atom.workspace).focus()

    atom.commands.add 'body', 'pane:show-item-1': ->
      atom.views.getView(atom.workspace).focus()

    atom.commands.add 'body', 'pane:show-item-2': ->
      atom.views.getView(atom.workspace).focus()

    atom.commands.add 'body', 'pane:show-item-3': ->
      atom.views.getView(atom.workspace).focus()

    atom.commands.add 'body', 'pane:show-item-4': ->
      atom.views.getView(atom.workspace).focus()

    atom.commands.add 'body', 'pane:show-item-5': ->
      atom.views.getView(atom.workspace).focus()

    atom.commands.add 'body', 'pane:show-item-6': ->
      atom.views.getView(atom.workspace).focus()

    atom.commands.add 'body', 'pane:show-item-7': ->
      atom.views.getView(atom.workspace).focus()

    atom.commands.add 'body', 'pane:show-item-8': ->
      atom.views.getView(atom.workspace).focus()

    atom.commands.add 'body', 'pane:show-item-9': ->
      atom.views.getView(atom.workspace).focus()

  deactivate: ->
    @subscriptions.dispose()
    @subscriptions = null

  revealActiveFile: ->
    treeView = atom.views.getView(atom.workspace).querySelector('.tree-view')

    #check if panel is open
    if treeView
      atom.commands.dispatch(atom.views.getView(atom.workspace), 'tree-view:reveal-active-file')

      selectedListItem = treeView.querySelector('.list-tree .selected')

      if selectedListItem
        selectedListItem.scrollIntoViewIfNeeded()
