# LogLocationToQtCreator

## idea
au3-script opens UDP-port-listener, which reacts to packages containing file-path and line-number. Then aactivate the first found QtCreator-window (if multiple), then send CTRL+K as short-cut, then insert the message-text, then ENTER.
And then the QtCreator-editor-window shall jump to the respective location, which was given by the LogViewer.

Also: LogViewer has to be modified to send such a package, of course ;)

## why a au3-script?
Investigation how to create QtCreator-plugins yielded some really, really big amount of infrastructure and conditions, which have be met to build a real QtC-plugin.
For a prototype some small, lightly coupled implementation seems better.
