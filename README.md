# Synced-Sidebar Atom Package [![Build Status](https://travis-ci.org/peterdotjs/atom-synced-sidebar.svg?branch=master)](https://travis-ci.org/peterdotjs/atom-synced-sidebar)

Based on Sublime Text [SyncedSideBar](https://github.com/sobstel/SyncedSideBar) plugin. Active tab & sidebar are synced - sidebar entry automatically scrolls into view.

Atom Package: https://atom.io/packages/synced-sidebar

[Demo](https://www.youtube.com/watch?v=fwYiFJ-9A6Y)

[![Sync Sidebar Atom Package Animation](https://raw.githubusercontent.com/peterdotjs/atom-synced-sidebar/master/synced-sidebar-min.gif)](https://www.youtube.com/watch?v=fwYiFJ-9A6Y)

## Installation

```bash
apm install synced-sidebar
```
Or Settings/Preferences ➔ Packages ➔ Search for `synced-sidebar`

## Use

By default the sidebar (tree view) is not in sync with the active tab. With synced-sidebar installed the tab is revealed in the sidebar anytime a tab is active. If the active file in the sidebar is not currently in view (below or above the current viewport), the sidebar will automatically scroll the active file into view.

If the sidebar is collapsed, synced-sidebar doesn't do anything. The sidebar remains collapsed as is.

## Configuration

Currently there aren't configurations since there's only one thing the package does. You can either have the package enabled or disabled. Let me know if you think there's a use case for configs.

## License

[MIT](https://github.com/peterdotjs/atom-synced-sidebar/blob/master/LICENSE.md) © [Peter Shin](https://github.com/peterdotjs)
