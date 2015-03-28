window.SO = {
  elem: function(tag) {
    return document.createElement(tag);
  },
  delay: function(time, fn) {
    return setTimeout(fn, time);
  },
  hideFlash: function() {
    $('.flash-messages').fadeOut(2000, function() { $('.flash-messages').remove() });
  }
};
