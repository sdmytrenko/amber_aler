module ApplicationHelper

  def sanitize_wysiwyg(text, shorten: nil)
    res = sanitize(text, tags: %w(p strong em u table thead tbody th tr td h4 h5 h6 pre br hr ul ol li blockquote), attributes: %w(id class style))
    res = truncate_html(res, length: shorten, omission: '...') if shorten.present?
    res
  end

  # It was for identicon and now dont using
  # def email_hexdigest_for(user)
  #   Digest::MD5.hexdigest(user.email&.downcase)
  # end
end
