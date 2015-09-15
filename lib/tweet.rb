require 'twitter'
require 'byebug'

module TweetService

  def self.client
    client = Twitter::REST::Client.new do |config| 
      config.consumer_key        = ENV['CONSUMER_KEY']
      config.consumer_secret     = ENV['CONSUMER_SECRET']
      config.access_token        = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end
  end
  
  def self.user(user_name)
    self.client.user(user_name)
  end
  
  def self.tweet(message)
    self.client.update(message)
  end
  
  def self.search(to, text)
    #qty = args[:qty] || 5
    client.search("to:#{to} #{text}", result_type: "recent").take(5).collect do |tweet|
      "#{tweet.user.screen_name}: #{tweet.text}"
    end
  end 
  
  def self.fetch_timeline(user)
    self.client.user_timeline(user)
  end
end
