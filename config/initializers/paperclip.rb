Paperclip.interpolates :booking_id do |attachment, style|
  attachment.instance.booking_id
end

Paperclip.interpolates :gallery_id do |attachment, style|
  attachment.instance.gallery_id
end

Paperclip.interpolates :photographer_id do |attachment, style|
  attachment.instance.photographer_id
end