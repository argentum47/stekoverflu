SO.tagging = function() {
  $(".select-tags").on("change", function() {
    var h = SO.render($("#tag-template").html(), {name: $("option:selected").text(), id: $(this).val()});
    $(".tag-lists").append(h);
  });

  $(".remove-tag").on("click", function() {
    event.preventDefault();
    $(this).parentsUntil("li").remove();
  });

}