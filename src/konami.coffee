default_sequence = 'up, up, down, down, left, right, left, right, B, A'

class @KonamiCode
  constructor: (@callback, keys_text = default_sequence) ->
    @seq = new Sequence(keys_text.split ',')
    @key_index = 0

    # watch for events
    @add_listener()

  add_listener: ->
    if document?.addEventListener
      document.addEventListener 'keydown', @listen
    else if document?.attachEvent
      document.attachEvent 'keydown', @listen

  listen: (event) =>
    code = event.which or event.keyCode or event
    if @seq.current() is code
      @seq.next()
    else
      @seq.reset()

    if @seq.is_last()
      @seq.reset()
      @callback()

  sequence: =>
    @seq.codes


class Sequence
  constructor: (key_names) ->
     @codes = (Sequence.map name for name in key_names)
     @key_index = 0

  current: ->
    @codes[@key_index]

  reset: ->
    @key_index = 0
    @current()

  next: ->
    @key_index++

  is_last: ->
    @key_index >= @codes.length


  @map: (name) ->
    name = dewhitespace(name).toUpperCase()
    if name.length is 1
      name.charCodeAt 0
    else
      switch name
        when 'UP'     then 38
        when 'DOWN'   then 40
        when 'LEFT'   then 37
        when 'RIGHT'  then 39
        when 'ENTER'  then 13


dewhitespace = (text) ->
  text.replace /\s+/g, ''
