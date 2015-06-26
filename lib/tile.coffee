module.exports =
class Tile
  constructor: (position, value) ->
    @x = position.x
    @y = position.y
    @value = value or 2
    @previousPosition = null
    @mergedFrom = null # Tracks tiles that merged together
    return

  savePosition: ->
    @previousPosition =
      x: @x
      y: @y

    return

  updatePosition: (position) ->
    @x = position.x
    @y = position.y
    return
