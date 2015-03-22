require 'json'

LIBE_RSS = 'http://rss.liberation.fr/rss/9/'
NYT_RSS  = 'http://rss.nytimes.com/services/xml/rss/nyt/InternationalHome.xml'

class TheNews < Sinatra::Base
  get '/' do
    @libe_articles = fetch_articles(LIBE_RSS)
    @nyt_articles  = fetch_articles(NYT_RSS)

    haml :index
  end

  def fetch_articles(feed)
    Feedjira::Feed.fetch_and_parse(feed).entries.take(5).map do |entry|
      { url: entry.url, title: entry.title }
    end
  end
end
