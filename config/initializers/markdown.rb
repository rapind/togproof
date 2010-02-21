class String
  def markdown
    RDiscount.new(self).to_html
  end
end