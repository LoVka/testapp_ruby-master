require 'rails_helper'

RSpec.describe "RSS", type: :request do
  describe "GET #latest" do
    let(:category) { create(:category, slug: 'test-category') }
    let!(:post) { create(:post, category: category, title: 'Test Post', body: '**Test Post** _Body_ Exmpale.') }

    it "gets latest posts RSS" do
      get '/rss/latest.xml'
      expect(response).to be_ok
      expect(response.body).to eq <<-XML.strip_heredoc
        <?xml version="1.0" encoding="UTF-8"?>
        <rss version="2.0" xmlns:media="http://www.example.com/" xmlns:atom="https://www.w3.org/2005/Atom" xmlns:dcterms="https://purl.org/dc/terms/">
          <channel>
            <title>Latest</title>
            <link>http://www.example.com/rss/latest.xml</link>
            <atom:link rel="self" href="http://www.example.com/"/>
            <description>Latest news</description>
            <item>
              <title>Test Post</title>
              <guid isPermaLink="false">#{post.id}</guid>
              <link>http://www.example.com/test-category/#{post.id}</link>
              <description>Test Post Body Exmpale.</description>
              <pubDate>#{post.created_at.to_datetime.new_offset('CST').strftime('%^b %e %Y')}</pubDate>
            </item>
          </channel>
        </rss>
      XML
    end
  end

  describe "GET #category" do
    let(:category) { create(:category, name: 'Waeather', slug: 'waeather') }
    let!(:post) { create(:post, category: category, title: 'Test Post', body: '**Test Post** _Body_ Exmpale.') }

    it "gets requested category's posts" do
      get "/rss/category/#{category.slug}.xml"
      expect(response).to be_ok
      expect(response.body).to eq <<-XML.strip_heredoc
        <?xml version="1.0" encoding="UTF-8"?>
        <rss version="2.0" xmlns:media="http://www.example.com/" xmlns:atom="https://www.w3.org/2005/Atom" xmlns:dcterms="https://purl.org/dc/terms/">
          <channel>
            <title>Waeather</title>
            <link>http://www.example.com/rss/category/waeather.xml</link>
            <atom:link rel="self" href="http://www.example.com/"/>
            <description>Latest news for Waeather</description>
            <item>
              <title>Test Post</title>
              <guid isPermaLink="false">#{post.id}</guid>
              <link>http://www.example.com/waeather/#{post.id}</link>
              <description>Test Post Body Exmpale.</description>
              <pubDate>#{post.created_at.to_datetime.new_offset('CST').strftime('%^b %e %Y')}</pubDate>
            </item>
          </channel>
        </rss>
      XML
    end
  end

  describe "GET #editorial" do
    let(:category) { create(:category, name: 'Waeather', slug: 'waeather') }
    let(:post) { create(:post, category: category, title: 'Test Post', body: '**Test Post** _Body_ Exmpale.') }
    let(:list) { create(:editorial_list, title: 'Test List', slug: 'test-list', posts: [post]) }

    it "gets requested list's posts" do
      get "/rss/editorial/#{list.slug}.xml"
      expect(response).to be_ok
      expect(response.body).to eq <<-XML.strip_heredoc
        <?xml version="1.0" encoding="UTF-8"?>
        <rss version="2.0" xmlns:media="http://www.example.com/" xmlns:atom="https://www.w3.org/2005/Atom" xmlns:dcterms="https://purl.org/dc/terms/">
          <channel>
            <title>Test List</title>
            <link>http://www.example.com/rss/editorial/test-list.xml</link>
            <atom:link rel="self" href="http://www.example.com/"/>
            <description>Test List articles</description>
            <item>
              <title>Test Post</title>
              <guid isPermaLink="false">#{post.id}</guid>
              <link>http://www.example.com/waeather/#{post.id}</link>
              <description>Test Post Body Exmpale.</description>
              <pubDate>#{post.created_at.to_datetime.new_offset('CST').strftime('%^b %e %Y')}</pubDate>
            </item>
          </channel>
        </rss>
      XML
    end
  end
end
