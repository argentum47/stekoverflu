module ApplicationHelper
  def flash_message_class(key)
    return 'danger' if key == 'alert'
    return 'success' if key == 'notice'
    key
  end

  def you_or_user(qa)
    qa.user == current_user ? "You" : qa.user.nickname
  end
end
