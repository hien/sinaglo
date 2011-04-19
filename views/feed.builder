xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  xml.title SITE_NAME
  xml.id "http://#{SITE_DOMAIN}/"
  xml.updated @posts.first.published_at if @posts.any?
  xml.author { xml.name SITE_AUTHOR }

  @posts.each do |post|
    xml.entry do
      xml.title post.title
      xml.link "rel" => "alternate", "href" => "http://#{SITE_DOMAIN}/#{post.url}"
      xml.id post.url
      xml.published post.published_at
      xml.updated post.published_at
      xml.author { xml.name SITE_AUTHOR }
      xml.summary post.to_html, "type" => "html"
      xml.content post.to_html, "type" => "html"
    end
  end
end

