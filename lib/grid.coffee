module.exports =
class Grid
  constructor: (size) ->
    @size = size
    @cells = []
    @build()
    return

  build: ->
    x = 0

    while x < @size
      row = @cells[x] = []
      y = 0

      while y < @size
        row.push null
        y++
      x++
    return

  randomAvailableCell: ->
    cells = @availableCells()
    cells[Math.floor(Math.random() * cells.length)]  if cells.length

  availableCells: ->
    cells = []
    @eachCell (x, y, tile) ->
      unless tile
        cells.push
          x: x
          y: y

      return

    cells

  eachCell: (callback) ->
    x = 0

    while x < @size
      y = 0

      while y < @size
        callback x, y, @cells[x][y]
        y++
      x++
    return

  cellsAvailable: ->
    !!@availableCells().length

  cellAvailable: (cell) ->
    not @cellOccupied(cell)

  cellOccupied: (cell) ->
    !!@cellContent(cell)

  cellContent: (cell) ->
    if @withinBounds(cell)
      @cells[cell.x][cell.y]
    else
      null

  insertTile: (tile) ->
    @cells[tile.x][tile.y] = tile
    return

  removeTile: (tile) ->
    @cells[tile.x][tile.y] = null
    return

  withinBounds: (position) ->
    position.x >= 0 and position.x < @size and position.y >= 0 and position.y < @size
