# finch-externaleditor
multiline external editor for finch
## install
`alt-a -> plugins -> install new plugin -> exted.pl -> [X]`
## usage
the command `/exted` in conversation window will launch $EDITOR, where you can put multiline content. this content will be posted in conversation ot chatroom as single multiline message.
## know bugs
finch does not redraw interface after launching editor, so you should do it manually by pressing alt-l. if you know a way to force redraw, please inform or make pull request
