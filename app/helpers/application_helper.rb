module ApplicationHelper
  
  def keywords_to_labels(keywords)
    result = ''
    unless keywords.blank?
      keywords.split(', ').each do |keyword|
        result += content_tag(:span, keyword, :class => "label label-info") + ' '
      end
    end
    result.html_safe
  end
  
end
