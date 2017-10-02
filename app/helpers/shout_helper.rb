module ShoutHelper
  def like_button(shout)
    if current_user.liked?(shout)
      link_to 'unlike', unlike_shout_path(shout), method: :delete
    else
      link_to 'Like', like_shout_path(shout), method: :post
    end
  end

  def autolink(text)
    text.gsub(/@\w+/) do |mention|
      link_to mention, user_path(mention[1..-1])
    end.html_safe
  end

  def shout_form_for(content_type)
    form_for Shout.new do |form|
      form.hidden_field(:content_type, value: content_type) +
      form.fields_for(:content) { |content_form| yield(content_form) } +
      form.submit('Shout!')
    end
  end
end
