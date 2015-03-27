window.SO = {
  elem: function(tag) {
    return document.createElement(tag);
  },
  delay: function(time, fn) {
    return setTimeout(fn, time);
  }
};

// $(function() {
//   $('.flash-messages').fadeOut(1000, function() { $('.flash-messages').remove() });
// });
