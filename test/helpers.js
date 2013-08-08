// Generated by CoffeeScript 1.3.3
(function() {

  this.keydown = function(code) {
    var event;
    event = document.createEventObject ? document.createEventObject() : document.createEvent("Events");
    if (typeof event.initEvent === "function") {
      event.initEvent("keydown", true, true);
    }
    event.keyCode = code;
    event.which = code;
    if (document.dispatchEvent) {
      return document.dispatchEvent(event);
    } else {
      return document.fireEvent("onkeydown", event);
    }
  };

  this.add_script = function(script) {
    var script_element;
    script_element = document.createElement('script');
    script_element.innerHTML = script;
    return document.body.appendChild(script_element);
  };

}).call(this);