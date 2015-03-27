SO.tagging = function() {
  $(".select-tags").on("change", function() {
    var h = SO.render($("#tag-template").html(), {name: $("option:selected").text(), id: $(this).val()});
    $(".tag-lists").append(h);
  });

  $(".tag-lists").on("click", ".remove-tag", function() {
    event.preventDefault();
    $(this).parentsUntil(".tag-lists").remove();
  });

}
