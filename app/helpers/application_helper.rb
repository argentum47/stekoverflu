module ApplicationHelper
  def unobtrusive_js(code)
    if request.xhr?
      javascript_tag(code)
    else
      @unobtrusive_js ||= []
      @unobtrusive_js << code
      nil
    end
  end

  def include_unobtrusive_js
    @unobtrusive_js ||= []
    javascript_tag(@unobtrusive_js.join(";\n"))
  end

  def flash_message_class(key)
    return 'danger' if key == 'alert'
    return 'success' if key == 'notice'
    key
  end

  def you_or_user(qa)
    qa.user == current_user ? "You" : qa.user.nickname
  end

  def provider_user_account_url(user)
    "https://#{user.provider}.com/#{user.nickname}"
  end

  def provider_user_account_avatar(user, size = 100)
    "#{user.avatar}&amp;size=#{size}"
  end
end
