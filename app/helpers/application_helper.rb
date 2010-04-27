# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def display_flash   
    html = ''
    # if we get double flash messages, remove one of them. For some reason inherited resources decided to add a new flash message.
    flash.discard(:success) if flash[:notice] and flash[:success]
    if flash[:notice] or flash[:warning] or flash[:error]
      html = "<script type=\"text/javascript\">\n$(document).ready(function() {\n"
      flash.each do |key,value|
        if !value.blank?
          if controller.controller_name == 'products' and controller.action_name == 'show'
            html = "#{html}\n$('.flash_notice').show();\n$('.flash_notice span').html('#{value.gsub('"', '\\"')}');"
          else
            html = "#{html}$.gritter.add({ \ntitle: \"#{key.to_s.capitalize}\", \ntext: \"#{value.gsub('"', '\\"')}\", \nimage: \"/images/icons/#{key.to_s}.png\", \ntime: 3000 \n});\n"
          end
        end
      end
      html = "#{html}});\n</script>"
    end
    return html
  end
  
  def build_submit_button(title)
    "<button type='submit' class='button positive'> #{image_tag('icons/positive.png')} #{title} </button>"
  end
  
  def build_link_button(title, path)
    "<p class='buttons'>#{link_to(image_tag('icons/positive.png') + ' ' + title, path, :class => 'button positive')}</p>"
  end
  
end
