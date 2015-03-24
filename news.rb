require 'json'

LIBE_RSS    = 'http://rss.liberation.fr/rss/9/'
REDDIT_NEWS = 'http://www.reddit.com/r/news/.rss'

class TheNews < Sinatra::Base
  get '/' do
    @libe_articles   = fetch_articles(LIBE_RSS)
    @reddit_articles = fetch_articles(REDDIT_NEWS)

    haml :index
  end

  def fetch_articles(feed)
    Feedjira::Feed.fetch_and_parse(feed).entries.take(5).map do |entry|
      { url: entry.url, title: entry.title }
    end
  end
end
