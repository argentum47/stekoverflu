window.SO =
  elem: (tag)->
    document.createElement(tag)

  delay: (time, fn) ->
    setTimeout(fn, time)

$ ->
  SO.delay 500, ->
    $('.flash-messages').remove();
