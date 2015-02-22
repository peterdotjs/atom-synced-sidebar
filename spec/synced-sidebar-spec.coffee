SyncedSidebar = require '../lib/synced-sidebar'
_ = require 'underscore-plus'
{$, $$} = require 'atom-space-pen-views'
fs = require 'fs-plus'
path = require 'path'
temp = require('temp').track()
os = require 'os'

waitsForFileToOpen = (causeFileToOpen) ->
  waitsFor (done) ->
    disposable = atom.workspace.onDidOpen ->
      disposable.dispose()
      done()
    causeFileToOpen()

describe "SyncedSidebar", ->
  [treeView, root1, root2, sampleJs, sampleTxt, workspaceElement] = []

  selectEntry = (pathToSelect) ->
    treeView.selectEntryForPath atom.project.getDirectories()[0].resolve pathToSelect

  beforeEach ->
    fixturesPath = atom.project.getPaths()[0]
    atom.project.setPaths([
      path.join(fixturesPath, "root-dir1")
      path.join(fixturesPath, "root-dir2")
    ])

    workspaceElement = atom.views.getView(atom.workspace)

    waitsForPromise -> atom.packages.activatePackage("tabs")
    waitsForPromise -> atom.packages.activatePackage("tree-view")
    waitsForPromise -> atom.packages.activatePackage("synced-sidebar")


    runs ->
      atom.commands.dispatch(workspaceElement, 'tree-view:toggle')
      treeView = $(atom.workspace.getLeftPanels()[0].getItem()).view()

      root1 = $(treeView.roots[0])
      root2 = $(treeView.roots[1])
      sampleJs = treeView.find('.file:contains(tree-view.js)')
      sampleTxt = treeView.find('.file:contains(tree-view.txt)')

      expect(treeView.roots[0].directory.watchSubscription).toBeTruthy()

  afterEach ->
    temp.cleanup()

  describe "when file is selected in tabs pane", ->
    beforeEach ->
      jasmine.attachToDOM(workspaceElement)

    describe "if sidebar tree view is open", ->
      it "shows and focuses the tree view selects the file", ->
        waitsForPromise ->
          atom.workspace.open(path.join(atom.project.getPaths()[0], 'dir1', 'file1'))

        runs ->
          expect(treeView.selectedEntry().getPath()).toContain(path.join("dir1", "file1"))

        waitsForPromise ->
          atom.workspace.open(path.join(atom.project.getPaths()[1], 'dir3', 'file3'))

        runs ->
          expect(treeView.selectedEntry().getPath()).toContain(path.join("dir3", "file3"))

    describe "if sidebar tree view is closed", ->
      beforeEach ->
        atom.commands.dispatch(workspaceElement, 'tree-view:show')
        atom.commands.dispatch(workspaceElement, 'tree-view:toggle')

      it "does not open sidebar tree view", ->
        waitsForPromise ->
          atom.workspace.open(path.join(atom.project.getPaths()[0], 'dir1', 'file1'))

        runs ->
          expect(treeView.selectedEntry().getPath()).not.toContain(path.join("dir1", "file1"))

        waitsForPromise ->
          atom.workspace.open(path.join(atom.project.getPaths()[1], 'dir3', 'file3'))

        runs ->
          expect(treeView.selectedEntry().getPath()).not.toContain(path.join("dir3", "file3"))
