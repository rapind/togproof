module SitemapHelper
  # used to generate the dates in the google sitemap (see sitemap_controller.rb)
  def w3c_date(date)
    date.utc.strftime("%Y-%m-%d")
  end
end