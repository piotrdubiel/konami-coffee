@keydown = (code) ->
  event = 
    if document.createEventObject 
      document.createEventObject()
    else
      document.createEvent "Events"
  
  event.initEvent? "keydown", true, true
  
  event.keyCode = code
  event.which = code
    
  if document.dispatchEvent
    document.dispatchEvent(event)
  else
    document.fireEvent("onkeydown", event)


@add_script = (script)->
  script_element = document.createElement 'script'
  script_element.innerHTML = script
  document.body.appendChild script_element
