module.exports =
  activate: (state) ->
    atom.commands.add 'atom-workspace', 'transpose-selection:transpose': =>
      @transpose()

  transpose: ->
    editor = atom.workspace.getActiveTextEditor()
    selections = editor.getSelections()

    return unless selections.length > 1

    i = 1
    a = selections[0].getText()

    while i < selections.length
      b = selections[i].getText()
      selections[i].insertText(a, {select: true})
      a = b

      i++

    selections[0].insertText(a, {select: true})
