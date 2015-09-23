@markdownPreview = (input, preview, hiddenDiv) ->
  preview.html(markdown.toHTML(input.val()))
  hiddenDiv.html(input.val().replace(/\n/g, '<br>') + '<br>')
  hiddenDiv.width(input.width())
  input.height(hiddenDiv.height())

$ ->
  input = $("#markdown-input")
  preview = $("#markdown-preview")
  hiddenDiv = $(document.createElement('div'))
  hiddenDiv.addClass('hiddenDiv')
  $('body').append(hiddenDiv)
  markdownPreview(input, preview, hiddenDiv)
  input.keyup ->
    markdownPreview(input, preview, hiddenDiv)
