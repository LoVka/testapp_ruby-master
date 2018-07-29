xml.instruct! :xml, version: '1.0'
xml.rss version: '2.0', 'xmlns:media': root_url, 'xmlns:atom': 'https://www.w3.org/2005/Atom', 'xmlns:dcterms': 'https://purl.org/dc/terms/' do
  xml.channel do
    xml.title @list.title
    xml.link rss_list_url(slug: @list.slug)
    xml.atom :link, rel: :self, href: root_url
    xml.description "#{@list.title} articles"

    @posts.each do |post|
      xml.item do
        xml.title post.title
        xml.guid post.id, isPermaLink: false
        xml.link home_post_url(category: post.category.slug, id: post)
        xml.description @markdown.render(post.body).chomp
        xml.pubDate post.created_at.to_datetime.new_offset('CST').strftime('%^b %e %Y')
      end
    end
  end
end
