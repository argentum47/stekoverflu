SO.render = function (template, data) {
  var fields = []
    , re = /{{([^}}]+)}}/g
    , text
  ;

  while ((text = re.exec(template)) !== null) {
    fields.push(text[1]);
  }

  for (var i = 0; i < fields.length; ++i) {
    template = template.replace(new RegExp("{{" + fields[i] + "}}"), data[fields[i]]);
  }

  return template;
}
