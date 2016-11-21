module ApplicationHelper
  def emojify(content)
    h(content).to_str.gsub(/:([\w+-]+):/) do |match|
      if emoji = Emoji.image_url_for_name(Regexp.last_match(1))
        %(<img alt="#{Regexp.last_match(1)}" src="#{emoji}" style="vertical-align:middle" width="20" height="20" />)
      else
        match
      end
    end.html_safe if content.present?
  end
end
