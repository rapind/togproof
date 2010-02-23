# Serves the gallery images, title, and descriptions for the front page slides.
# See: http://www.progressivered.com/cu3er/docs/
xml.instruct!

xml.cu3er do
  xml.settings do
    xml.transitions :duration => 1.5
    xml.auto_play do
      xml.defaults :symbol => "circular", :time => "7"
      xml.tweenIn :x => "910", :y => "50", :width => "30", :height => "30", :tint => "0xFFFFFF", :alpha => "0.5"
      xml.tweenOver :alpha => "1"
    end
    xml.prev_button do
      xml.defaults :round_corners => "5,5,5,5"
      xml.tweenOver :tint => "0xFFFFFF", :scaleX => "1.1", :scaleY => "1.1"
      xml.tweenOut :tint => "0x000000"
    end
    xml.prev_symbol do
      xml.tweenOver :tint => "0x000000", :time => "0.15"
    end
    xml.next_button do
      xml.defaults :round_corners => "5,5,5,5"
      xml.tweenOver :tint => "0xFFFFFF", :scaleX => "1.1", :scaleY => "1.1"
      xml.tweenOut :tint => "0x000000"
    end
    xml.next_symbol do
      xml.tweenOver :tint => "0x000000", :time => "0.15"
    end
    xml.description do
      xml.defaults  :round_corners => "10, 10, 10, 10", 
                    :heading_text_size => "28", 
                    :heading_text_color => "0xFF9000", 
                    :paragraph_text_size => "18",
                    :paragraph_text_color => "0xFFFFFF"
    	xml.tweenIn :x => "150", :y => "360", :width => "660", :height => "170", :alpha => "0.5"
      xml.tweenOver :alpha => "0.8"
    end
  end
  xml.slides do
    for gallery in @galleries
      xml.slide do
        xml.url gallery.image.url
        xml.link gallery_path(gallery), :target => "_self"
        xml.description do
          xml.link gallery_path(gallery), :target => "_self"
          xml.heading gallery.title
          xml.paragraph gallery.description
        end
      end
    end
  end
end

