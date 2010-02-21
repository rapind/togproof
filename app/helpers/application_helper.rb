# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  # to add a css class to the body tag of each page equal to the controller name
  # you can add additional classes to the body tag in your yielded view using
  # <% body_classes << 'anotherclass' %>
  def body_classes
    @body_classes ||= [controller.controller_name]
  end
  
  def display_flash
    html = ''
    if flash[:notice] or flash[:warning] or flash[:error]
      html = "<script type=\"text/javascript\">\n$(document).ready(function() {\n"
      flash.each do |key,value|
        if !value.blank?
          html = "#{html}$.gritter.add({ \ntitle: \"#{key.to_s.capitalize}\", \ntext: \"#{value}\", \nimage: \"/images/icons/#{key.to_s}.png\", \ntime: 3000 \n});\n"
        end
      end
      html = "#{html}});\n</script>"
    end
  end
  
end
