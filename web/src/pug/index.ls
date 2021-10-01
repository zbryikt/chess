<-(->it.apply {}) _
@cur = 1
cells = [0 til 361].map (d,i) ->
  x = d % 19
  y = Math.floor(d / 19)
  {x, y, v: 0}
view = new ldview do
  root: document.body
  handler:
    cell:
      list: -> cells
      handler: ({node, data}) ->
        node.classList.toggle \black, data.v == 1
        node.classList.toggle \white, data.v == 2
      action: click: ({node, data}) ~>
        if data.v => data.v = 0
        else
          data.v = @cur
          @cur = 3 - @cur
        view.render!

