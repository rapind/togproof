xml.instruct! :xml, :version => '1.0', :encoding => 'UTF-8'

# create the urlset
xml.urlset :xmlns => 'http://www.sitemaps.org/schemas/sitemap/0.9' do

  # Root
  xml.url do
    xml.loc root_url
    xml.lastmod Time.zone.now.strftime('%Y-%m-%d')
  end

  # Galleries
  galleries.each do |gallery|
    xml.url do # create the url entry, with the specified location and date
      xml.loc gallery_url(gallery)
      xml.lastmod gallery.updated_at.strftime('%Y-%m-%d')
    end
  end

  # Pages
  pages.each do |page|
    xml.url do # create the url entry, with the specified location and date
      xml.loc page_url(page)
      xml.lastmod page.updated_at.strftime('%Y-%m-%d')
    end
  end
  
  # Contact
  xml.url do # create the url entry, with the specified location and date
    xml.loc new_contact_request_url
    xml.lastmod photographer.updated_at.strftime('%Y-%m-%d')
  end

  if photographer.blog_url.blank?
    # Posts
    posts.each do |post|
      xml.url do # create the url entry, with the specified location and date
        xml.loc post_url(post)
        xml.lastmod post.updated_at.strftime('%Y-%m-%d')
      end
    end
  end

end