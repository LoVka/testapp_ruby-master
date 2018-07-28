xml.instruct! :xml, version: '1.0'
xml.rss version: '2.0', 'xmlns:media': 'http://localhost:3000', 'xmlns:atom': 'https://www.w3.org/2005/Atom', 'xmlns:dcterms': 'https://purl.org/dc/terms/' do
  xml.channel do
    xml.title @category.name
    xml.link "http://localhost:3000/category/#{@category.slug}.xml"
    xml.atom :link, rel: :self, href: 'http://localhost:3000/'
    xml.description 'Latest news for ' + @category.name

    @posts.each do |post|
      xml.item do
        xml.title post.title
        xml.guid post.id, isPermaLink: false
        xml.link 'http://localhost:3000/' + post.category.slug + '/' + post.id.to_s
        xml.description post.body
        xml.pubDate post.created_at.to_datetime.new_offset('CST').strftime('%^b %e %Y')
      end
    end
  end
end
