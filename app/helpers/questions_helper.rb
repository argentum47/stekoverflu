module QuestionsHelper
  def wordize_count(count, word)
    "No #{word.pluralize}" if count == 0
    "1 #{word.singularize}" if count == 1
    "#{count} #{word.pluralize}" if count > 1
  end
end
