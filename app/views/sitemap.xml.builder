xml.instruct!

xml.urlset "xmlns" => "http://www.google.com/schemas/sitemap/0.84" do
  
  # Home Page
  xml.url do
    xml.loc         root_url
    xml.lastmod     w3c_date(Time.now)
    xml.changefreq  "always"
    xml.priority    1.0
  end

  # Pages
  for page in @pages
    xml.url do
      xml.loc         page_url(page)
      xml.lastmod     w3c_date(Time.now)
      xml.changefreq  "weekly"
      xml.priority    0.8
    end
  end
  
  # Galleries
  for gallery in @galleries
    xml.url do
      xml.loc         gallery_url(gallery)
      xml.lastmod     w3c_date(gallery.updated_at)
      xml.changefreq  "weekly"
      xml.priority    0.8
    end
  end

end